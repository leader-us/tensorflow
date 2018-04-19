package leader.ctrl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.tensorflow.framework.DataType;
import org.tensorflow.framework.TensorProto;
import org.tensorflow.framework.TensorShapeProto;

import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import leader.ParseResult;
import net.coobird.thumbnailator.Thumbnails;
import tensorflow.serving.Model;
import tensorflow.serving.Predict;
import tensorflow.serving.PredictionServiceGrpc;

@RestController
public class RestCtrl {

	private final String UPLOADED_FOLDER = "images";
	private final ResourceLoader resourceLoader;

	@Autowired
	public RestCtrl(ResourceLoader resourceLoader) {
		this.resourceLoader = resourceLoader;
	}

	@RequestMapping(value = "/uploadfile", method = { RequestMethod.POST })
	public @ResponseBody ParseResult upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		System.out.println("upload() called");
		ParseResult resut = new ParseResult();
		if (file.isEmpty()) {
			request.setAttribute("message", "Please select a file to upload");
			resut.setHint("Please select a image to upload");
			return resut;
		}
		
		try {
			String severInfo = request.getParameter("severinf");
			resut.setSeverinf(severInfo);
			String[] serverItem = severInfo.split(":");
			String serverIP = serverItem[0];
			int serverPort = Integer.valueOf(serverItem[1]);
			String modelName=request.getParameter("modelname");
			resut.setModelname(modelName);
			byte[] bytes = file.getBytes();
			String fileId = System.currentTimeMillis() + "";
			String fileName = new File(UPLOADED_FOLDER, fileId).getAbsolutePath();
			Path path = Paths.get(fileName);
			Files.write(path, bytes);
			System.out.println("pic file "+path.toString());
			resut.setSuccess(true);
			resut.setClassId(judgeSinglePic(fileName,serverIP,serverPort,modelName));
			resut.setPicURL(fileId);
			return resut;

		} catch (Exception e) {
			resut.setSuccess(false);
			resut.setHint(e.toString());
			e.printStackTrace();
			return resut;
		}

	}

	@RequestMapping(method = RequestMethod.GET, value = "/showpic/{filename}")
	@ResponseBody
	public ResponseEntity<?> getFile(@PathVariable String filename) {

		try {
			return ResponseEntity
					.ok(resourceLoader.getResource("file:" + Paths.get(UPLOADED_FOLDER, filename).toString()));
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	private static int judgeSinglePic(String fileName,String serverIP,int serverPort,String modelName) throws IOException {

		// String fileName = "E:\\tensorflow\\ts on
		// k8man\\nminst\\mnist-client\\" + "example3.bmp";

		TensorShapeProto.Builder tensorShapeBuilder = TensorShapeProto.newBuilder();
		// 1 * 28 * 28
		tensorShapeBuilder.addDim(TensorShapeProto.Dim.newBuilder().setSize(1))
				.addDim(TensorShapeProto.Dim.newBuilder().setSize(28))
				.addDim(TensorShapeProto.Dim.newBuilder().setSize(28));
		TensorProto.Builder tensorProtoBuilder = TensorProto.newBuilder();
		tensorProtoBuilder.setDtype(DataType.DT_FLOAT);
		tensorProtoBuilder.setTensorShape(tensorShapeBuilder.build());
		BufferedImage im = Thumbnails.of(fileName).forceSize(28, 28).outputFormat("bmp").asBufferedImage();
		int w = im.getWidth();
		int h = im.getHeight();
		int[] intArray = new int[w * h];
		im.getRGB(0, 0, w, h, intArray, 0, w);
		// 转换图片到图片数组，匹配输入数据类型为Float
		for (int pixel : intArray) {
			float val = (255 - pixel) / 255;
			// System.out.println("value:" + val);
			tensorProtoBuilder.addFloatVal(val);
		}

		long t = System.currentTimeMillis();
		// 创建连接，注意usePlaintext设置为true表示用非SSL连接
		ManagedChannel channel = ManagedChannelBuilder.forAddress(serverIP, serverPort).usePlaintext(true).build();
		// 这里还是先用block模式
		PredictionServiceGrpc.PredictionServiceBlockingStub stub = PredictionServiceGrpc.newBlockingStub(channel);
		// 创建请求
		Predict.PredictRequest.Builder predictRequestBuilder = Predict.PredictRequest.newBuilder();
		// 模型名称和模型方法名预设
		Model.ModelSpec.Builder modelSpecBuilder = Model.ModelSpec.newBuilder();
		modelSpecBuilder.setName(modelName);
		modelSpecBuilder.setSignatureName("classes");
		predictRequestBuilder.setModelSpec(modelSpecBuilder);
		// 设置入参,访问默认是最新版本，如果需要特定版本可以使用tensorProtoBuilder.setVersionNumber方法

		predictRequestBuilder.putInputs("image", tensorProtoBuilder.build());
		// 访问并获取结果
		Predict.PredictResponse predictResponse = stub.predict(predictRequestBuilder.build());
		int classes = predictResponse.getOutputsOrThrow("classes").getIntVal(0);
		System.out.println(fileName + " classify is: " + classes);
		TensorProto predictions = predictResponse.getOutputsOrThrow("predictions");
		System.out.println("prob is: " + Arrays.toString(predictions.getFloatValList().toArray()));
		System.out.println("cost time: " + (System.currentTimeMillis() - t));
		return classes;
	}

}
