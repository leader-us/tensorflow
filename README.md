# tensorflow
tensorflow examples study，欢迎增加案例，提交更新代码

下载到虚机中，假如根目录为/root/tensorflow
运行下面命令，启动Tensorflow Serving，实现手写图片的AI识别服务
docker run -it  -p 8500:8500 -v /root/tensorflow/nmist/model:/model  mycat/tensorflowserving  /model_servers/tensorflow_model_server   --model_name=mnist --model_base_path=/model
然后，运行下面的客户端命令，手写图片上传识别
docker run  -it -p 8080:8080  mycat/nmist-webclient
在笔记本的浏览器中 访问虚机的IP地址+8080端口，出现Web界面
其中，Tensorflow Serving Server的输入框地址中，改为虚机的IP地址加服务端口号
上传手写图片进行识别

说明：
nmist-web-client工程为Java客户端代码，基于Spring Boot