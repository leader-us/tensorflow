��
��
:
Add
x"T
y"T
z"T"
Ttype:
2	
�
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
�
FusedBatchNorm
x"T

scale"T
offset"T	
mean"T
variance"T
y"T

batch_mean"T
batch_variance"T
reserve_space_1"T
reserve_space_2"T"
Ttype:
2"
epsilonfloat%��8"
data_formatstringNHWC"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
D
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
�
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*1.6.02v1.6.0-0-gd2e24b68��
�
-global_step/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
: *
_class
loc:@global_step*
valueB 
�
#global_step/Initializer/zeros/ConstConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 
�
global_step/Initializer/zerosFill-global_step/Initializer/zeros/shape_as_tensor#global_step/Initializer/zeros/Const*
T0	*
_class
loc:@global_step*
_output_shapes
: 
k
global_step
VariableV2*
_output_shapes
: *
_class
loc:@global_step*
shape: *
dtype0	
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
_output_shapes
: *
T0	*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step
v
PlaceholderPlaceholder*
dtype0*+
_output_shapes
:���������* 
shape:���������
f
Reshape/shapeConst*%
valueB"����         *
dtype0*
_output_shapes
:
h
ReshapeReshapePlaceholderReshape/shape*/
_output_shapes
:���������*
T0
�
0conv2d/kernel/Initializer/truncated_normal/shapeConst* 
_class
loc:@conv2d/kernel*%
valueB"            *
dtype0*
_output_shapes
:
�
/conv2d/kernel/Initializer/truncated_normal/meanConst* 
_class
loc:@conv2d/kernel*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1conv2d/kernel/Initializer/truncated_normal/stddevConst* 
_class
loc:@conv2d/kernel*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
:conv2d/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal0conv2d/kernel/Initializer/truncated_normal/shape*
dtype0*&
_output_shapes
:*
T0* 
_class
loc:@conv2d/kernel
�
.conv2d/kernel/Initializer/truncated_normal/mulMul:conv2d/kernel/Initializer/truncated_normal/TruncatedNormal1conv2d/kernel/Initializer/truncated_normal/stddev*&
_output_shapes
:*
T0* 
_class
loc:@conv2d/kernel
�
*conv2d/kernel/Initializer/truncated_normalAdd.conv2d/kernel/Initializer/truncated_normal/mul/conv2d/kernel/Initializer/truncated_normal/mean* 
_class
loc:@conv2d/kernel*&
_output_shapes
:*
T0
�
conv2d/kernel
VariableV2*
shape:*
dtype0*&
_output_shapes
:* 
_class
loc:@conv2d/kernel
�
conv2d/kernel/AssignAssignconv2d/kernel*conv2d/kernel/Initializer/truncated_normal*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
:
�
conv2d/kernel/readIdentityconv2d/kernel*&
_output_shapes
:*
T0* 
_class
loc:@conv2d/kernel
�
-conv2d/bias/Initializer/zeros/shape_as_tensorConst*
_class
loc:@conv2d/bias*
valueB:*
dtype0*
_output_shapes
:
�
#conv2d/bias/Initializer/zeros/ConstConst*
_output_shapes
: *
_class
loc:@conv2d/bias*
valueB
 *    *
dtype0
�
conv2d/bias/Initializer/zerosFill-conv2d/bias/Initializer/zeros/shape_as_tensor#conv2d/bias/Initializer/zeros/Const*
_output_shapes
:*
T0*
_class
loc:@conv2d/bias
s
conv2d/bias
VariableV2*
_class
loc:@conv2d/bias*
shape:*
dtype0*
_output_shapes
:
�
conv2d/bias/AssignAssignconv2d/biasconv2d/bias/Initializer/zeros*
T0*
_class
loc:@conv2d/bias*
_output_shapes
:
n
conv2d/bias/readIdentityconv2d/bias*
T0*
_class
loc:@conv2d/bias*
_output_shapes
:
e
conv2d/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
�
conv2d/Conv2DConv2DReshapeconv2d/kernel/read*
strides
*
paddingSAME*/
_output_shapes
:���������*
T0
t
conv2d/BiasAddBiasAddconv2d/Conv2Dconv2d/bias/read*
T0*/
_output_shapes
:���������
f
batch_normalization/ConstConst*
valueB*  �?*
dtype0*
_output_shapes
:
�
:batch_normalization/beta/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*+
_class!
loc:@batch_normalization/beta*
valueB:
�
0batch_normalization/beta/Initializer/zeros/ConstConst*+
_class!
loc:@batch_normalization/beta*
valueB
 *    *
dtype0*
_output_shapes
: 
�
*batch_normalization/beta/Initializer/zerosFill:batch_normalization/beta/Initializer/zeros/shape_as_tensor0batch_normalization/beta/Initializer/zeros/Const*
_output_shapes
:*
T0*+
_class!
loc:@batch_normalization/beta
�
batch_normalization/beta
VariableV2*
shape:*
dtype0*
_output_shapes
:*+
_class!
loc:@batch_normalization/beta
�
batch_normalization/beta/AssignAssignbatch_normalization/beta*batch_normalization/beta/Initializer/zeros*
T0*+
_class!
loc:@batch_normalization/beta*
_output_shapes
:
�
batch_normalization/beta/readIdentitybatch_normalization/beta*
T0*+
_class!
loc:@batch_normalization/beta*
_output_shapes
:
�
Abatch_normalization/moving_mean/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*2
_class(
&$loc:@batch_normalization/moving_mean*
valueB:*
dtype0
�
7batch_normalization/moving_mean/Initializer/zeros/ConstConst*2
_class(
&$loc:@batch_normalization/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1batch_normalization/moving_mean/Initializer/zerosFillAbatch_normalization/moving_mean/Initializer/zeros/shape_as_tensor7batch_normalization/moving_mean/Initializer/zeros/Const*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
_output_shapes
:
�
batch_normalization/moving_mean
VariableV2*2
_class(
&$loc:@batch_normalization/moving_mean*
shape:*
dtype0*
_output_shapes
:
�
&batch_normalization/moving_mean/AssignAssignbatch_normalization/moving_mean1batch_normalization/moving_mean/Initializer/zeros*
_output_shapes
:*
T0*2
_class(
&$loc:@batch_normalization/moving_mean
�
$batch_normalization/moving_mean/readIdentitybatch_normalization/moving_mean*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
_output_shapes
:
�
Dbatch_normalization/moving_variance/Initializer/ones/shape_as_tensorConst*6
_class,
*(loc:@batch_normalization/moving_variance*
valueB:*
dtype0*
_output_shapes
:
�
:batch_normalization/moving_variance/Initializer/ones/ConstConst*6
_class,
*(loc:@batch_normalization/moving_variance*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
4batch_normalization/moving_variance/Initializer/onesFillDbatch_normalization/moving_variance/Initializer/ones/shape_as_tensor:batch_normalization/moving_variance/Initializer/ones/Const*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
_output_shapes
:
�
#batch_normalization/moving_variance
VariableV2*6
_class,
*(loc:@batch_normalization/moving_variance*
shape:*
dtype0*
_output_shapes
:
�
*batch_normalization/moving_variance/AssignAssign#batch_normalization/moving_variance4batch_normalization/moving_variance/Initializer/ones*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
_output_shapes
:
�
(batch_normalization/moving_variance/readIdentity#batch_normalization/moving_variance*
_output_shapes
:*
T0*6
_class,
*(loc:@batch_normalization/moving_variance
�
"batch_normalization/FusedBatchNormFusedBatchNormconv2d/BiasAddbatch_normalization/Constbatch_normalization/beta/read$batch_normalization/moving_mean/read(batch_normalization/moving_variance/read*
epsilon%��'7*
T0*
is_training( *G
_output_shapes5
3:���������::::
`
batch_normalization/Const_1Const*
valueB
 *B`�;*
dtype0*
_output_shapes
: 
j
ReluRelu"batch_normalization/FusedBatchNorm*
T0*/
_output_shapes
:���������
�
2conv2d_1/kernel/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*"
_class
loc:@conv2d_1/kernel*%
valueB"            
�
1conv2d_1/kernel/Initializer/truncated_normal/meanConst*
_output_shapes
: *"
_class
loc:@conv2d_1/kernel*
valueB
 *    *
dtype0
�
3conv2d_1/kernel/Initializer/truncated_normal/stddevConst*"
_class
loc:@conv2d_1/kernel*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
<conv2d_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal2conv2d_1/kernel/Initializer/truncated_normal/shape*
T0*"
_class
loc:@conv2d_1/kernel*
dtype0*&
_output_shapes
:
�
0conv2d_1/kernel/Initializer/truncated_normal/mulMul<conv2d_1/kernel/Initializer/truncated_normal/TruncatedNormal3conv2d_1/kernel/Initializer/truncated_normal/stddev*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
:
�
,conv2d_1/kernel/Initializer/truncated_normalAdd0conv2d_1/kernel/Initializer/truncated_normal/mul1conv2d_1/kernel/Initializer/truncated_normal/mean*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
:
�
conv2d_1/kernel
VariableV2*"
_class
loc:@conv2d_1/kernel*
shape:*
dtype0*&
_output_shapes
:
�
conv2d_1/kernel/AssignAssignconv2d_1/kernel,conv2d_1/kernel/Initializer/truncated_normal*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
:
�
conv2d_1/kernel/readIdentityconv2d_1/kernel*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
:
�
/conv2d_1/bias/Initializer/zeros/shape_as_tensorConst* 
_class
loc:@conv2d_1/bias*
valueB:*
dtype0*
_output_shapes
:
�
%conv2d_1/bias/Initializer/zeros/ConstConst* 
_class
loc:@conv2d_1/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
conv2d_1/bias/Initializer/zerosFill/conv2d_1/bias/Initializer/zeros/shape_as_tensor%conv2d_1/bias/Initializer/zeros/Const*
T0* 
_class
loc:@conv2d_1/bias*
_output_shapes
:
w
conv2d_1/bias
VariableV2*
dtype0*
_output_shapes
:* 
_class
loc:@conv2d_1/bias*
shape:
�
conv2d_1/bias/AssignAssignconv2d_1/biasconv2d_1/bias/Initializer/zeros*
_output_shapes
:*
T0* 
_class
loc:@conv2d_1/bias
t
conv2d_1/bias/readIdentityconv2d_1/bias*
_output_shapes
:*
T0* 
_class
loc:@conv2d_1/bias
g
conv2d_1/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
�
conv2d_1/Conv2DConv2DReluconv2d_1/kernel/read*/
_output_shapes
:���������*
T0*
strides
*
paddingSAME
z
conv2d_1/BiasAddBiasAddconv2d_1/Conv2Dconv2d_1/bias/read*/
_output_shapes
:���������*
T0
h
batch_normalization_1/ConstConst*
_output_shapes
:*
valueB*  �?*
dtype0
�
<batch_normalization_1/beta/Initializer/zeros/shape_as_tensorConst*-
_class#
!loc:@batch_normalization_1/beta*
valueB:*
dtype0*
_output_shapes
:
�
2batch_normalization_1/beta/Initializer/zeros/ConstConst*
_output_shapes
: *-
_class#
!loc:@batch_normalization_1/beta*
valueB
 *    *
dtype0
�
,batch_normalization_1/beta/Initializer/zerosFill<batch_normalization_1/beta/Initializer/zeros/shape_as_tensor2batch_normalization_1/beta/Initializer/zeros/Const*
_output_shapes
:*
T0*-
_class#
!loc:@batch_normalization_1/beta
�
batch_normalization_1/beta
VariableV2*-
_class#
!loc:@batch_normalization_1/beta*
shape:*
dtype0*
_output_shapes
:
�
!batch_normalization_1/beta/AssignAssignbatch_normalization_1/beta,batch_normalization_1/beta/Initializer/zeros*
T0*-
_class#
!loc:@batch_normalization_1/beta*
_output_shapes
:
�
batch_normalization_1/beta/readIdentitybatch_normalization_1/beta*
_output_shapes
:*
T0*-
_class#
!loc:@batch_normalization_1/beta
�
Cbatch_normalization_1/moving_mean/Initializer/zeros/shape_as_tensorConst*4
_class*
(&loc:@batch_normalization_1/moving_mean*
valueB:*
dtype0*
_output_shapes
:
�
9batch_normalization_1/moving_mean/Initializer/zeros/ConstConst*4
_class*
(&loc:@batch_normalization_1/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
�
3batch_normalization_1/moving_mean/Initializer/zerosFillCbatch_normalization_1/moving_mean/Initializer/zeros/shape_as_tensor9batch_normalization_1/moving_mean/Initializer/zeros/Const*4
_class*
(&loc:@batch_normalization_1/moving_mean*
_output_shapes
:*
T0
�
!batch_normalization_1/moving_mean
VariableV2*
dtype0*
_output_shapes
:*4
_class*
(&loc:@batch_normalization_1/moving_mean*
shape:
�
(batch_normalization_1/moving_mean/AssignAssign!batch_normalization_1/moving_mean3batch_normalization_1/moving_mean/Initializer/zeros*4
_class*
(&loc:@batch_normalization_1/moving_mean*
_output_shapes
:*
T0
�
&batch_normalization_1/moving_mean/readIdentity!batch_normalization_1/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_1/moving_mean*
_output_shapes
:
�
Fbatch_normalization_1/moving_variance/Initializer/ones/shape_as_tensorConst*8
_class.
,*loc:@batch_normalization_1/moving_variance*
valueB:*
dtype0*
_output_shapes
:
�
<batch_normalization_1/moving_variance/Initializer/ones/ConstConst*
_output_shapes
: *8
_class.
,*loc:@batch_normalization_1/moving_variance*
valueB
 *  �?*
dtype0
�
6batch_normalization_1/moving_variance/Initializer/onesFillFbatch_normalization_1/moving_variance/Initializer/ones/shape_as_tensor<batch_normalization_1/moving_variance/Initializer/ones/Const*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
_output_shapes
:
�
%batch_normalization_1/moving_variance
VariableV2*8
_class.
,*loc:@batch_normalization_1/moving_variance*
shape:*
dtype0*
_output_shapes
:
�
,batch_normalization_1/moving_variance/AssignAssign%batch_normalization_1/moving_variance6batch_normalization_1/moving_variance/Initializer/ones*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
_output_shapes
:
�
*batch_normalization_1/moving_variance/readIdentity%batch_normalization_1/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
_output_shapes
:
�
$batch_normalization_1/FusedBatchNormFusedBatchNormconv2d_1/BiasAddbatch_normalization_1/Constbatch_normalization_1/beta/read&batch_normalization_1/moving_mean/read*batch_normalization_1/moving_variance/read*
is_training( *G
_output_shapes5
3:���������::::*
epsilon%��'7*
T0
b
batch_normalization_1/Const_1Const*
valueB
 *B`�;*
dtype0*
_output_shapes
: 
n
Relu_1Relu$batch_normalization_1/FusedBatchNorm*
T0*/
_output_shapes
:���������
�
2conv2d_2/kernel/Initializer/truncated_normal/shapeConst*"
_class
loc:@conv2d_2/kernel*%
valueB"            *
dtype0*
_output_shapes
:
�
1conv2d_2/kernel/Initializer/truncated_normal/meanConst*"
_class
loc:@conv2d_2/kernel*
valueB
 *    *
dtype0*
_output_shapes
: 
�
3conv2d_2/kernel/Initializer/truncated_normal/stddevConst*"
_class
loc:@conv2d_2/kernel*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
<conv2d_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal2conv2d_2/kernel/Initializer/truncated_normal/shape*
dtype0*&
_output_shapes
:*
T0*"
_class
loc:@conv2d_2/kernel
�
0conv2d_2/kernel/Initializer/truncated_normal/mulMul<conv2d_2/kernel/Initializer/truncated_normal/TruncatedNormal3conv2d_2/kernel/Initializer/truncated_normal/stddev*&
_output_shapes
:*
T0*"
_class
loc:@conv2d_2/kernel
�
,conv2d_2/kernel/Initializer/truncated_normalAdd0conv2d_2/kernel/Initializer/truncated_normal/mul1conv2d_2/kernel/Initializer/truncated_normal/mean*
T0*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:
�
conv2d_2/kernel
VariableV2*
dtype0*&
_output_shapes
:*"
_class
loc:@conv2d_2/kernel*
shape:
�
conv2d_2/kernel/AssignAssignconv2d_2/kernel,conv2d_2/kernel/Initializer/truncated_normal*
T0*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:
�
conv2d_2/kernel/readIdentityconv2d_2/kernel*
T0*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:
�
/conv2d_2/bias/Initializer/zeros/shape_as_tensorConst* 
_class
loc:@conv2d_2/bias*
valueB:*
dtype0*
_output_shapes
:
�
%conv2d_2/bias/Initializer/zeros/ConstConst* 
_class
loc:@conv2d_2/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
conv2d_2/bias/Initializer/zerosFill/conv2d_2/bias/Initializer/zeros/shape_as_tensor%conv2d_2/bias/Initializer/zeros/Const*
T0* 
_class
loc:@conv2d_2/bias*
_output_shapes
:
w
conv2d_2/bias
VariableV2*
shape:*
dtype0*
_output_shapes
:* 
_class
loc:@conv2d_2/bias
�
conv2d_2/bias/AssignAssignconv2d_2/biasconv2d_2/bias/Initializer/zeros*
_output_shapes
:*
T0* 
_class
loc:@conv2d_2/bias
t
conv2d_2/bias/readIdentityconv2d_2/bias*
T0* 
_class
loc:@conv2d_2/bias*
_output_shapes
:
g
conv2d_2/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
�
conv2d_2/Conv2DConv2DRelu_1conv2d_2/kernel/read*
paddingSAME*/
_output_shapes
:���������*
T0*
strides

z
conv2d_2/BiasAddBiasAddconv2d_2/Conv2Dconv2d_2/bias/read*/
_output_shapes
:���������*
T0
h
batch_normalization_2/ConstConst*
valueB*  �?*
dtype0*
_output_shapes
:
�
<batch_normalization_2/beta/Initializer/zeros/shape_as_tensorConst*-
_class#
!loc:@batch_normalization_2/beta*
valueB:*
dtype0*
_output_shapes
:
�
2batch_normalization_2/beta/Initializer/zeros/ConstConst*-
_class#
!loc:@batch_normalization_2/beta*
valueB
 *    *
dtype0*
_output_shapes
: 
�
,batch_normalization_2/beta/Initializer/zerosFill<batch_normalization_2/beta/Initializer/zeros/shape_as_tensor2batch_normalization_2/beta/Initializer/zeros/Const*
T0*-
_class#
!loc:@batch_normalization_2/beta*
_output_shapes
:
�
batch_normalization_2/beta
VariableV2*
shape:*
dtype0*
_output_shapes
:*-
_class#
!loc:@batch_normalization_2/beta
�
!batch_normalization_2/beta/AssignAssignbatch_normalization_2/beta,batch_normalization_2/beta/Initializer/zeros*
_output_shapes
:*
T0*-
_class#
!loc:@batch_normalization_2/beta
�
batch_normalization_2/beta/readIdentitybatch_normalization_2/beta*
T0*-
_class#
!loc:@batch_normalization_2/beta*
_output_shapes
:
�
Cbatch_normalization_2/moving_mean/Initializer/zeros/shape_as_tensorConst*4
_class*
(&loc:@batch_normalization_2/moving_mean*
valueB:*
dtype0*
_output_shapes
:
�
9batch_normalization_2/moving_mean/Initializer/zeros/ConstConst*4
_class*
(&loc:@batch_normalization_2/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
�
3batch_normalization_2/moving_mean/Initializer/zerosFillCbatch_normalization_2/moving_mean/Initializer/zeros/shape_as_tensor9batch_normalization_2/moving_mean/Initializer/zeros/Const*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
_output_shapes
:
�
!batch_normalization_2/moving_mean
VariableV2*
shape:*
dtype0*
_output_shapes
:*4
_class*
(&loc:@batch_normalization_2/moving_mean
�
(batch_normalization_2/moving_mean/AssignAssign!batch_normalization_2/moving_mean3batch_normalization_2/moving_mean/Initializer/zeros*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
_output_shapes
:
�
&batch_normalization_2/moving_mean/readIdentity!batch_normalization_2/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
_output_shapes
:
�
Fbatch_normalization_2/moving_variance/Initializer/ones/shape_as_tensorConst*
dtype0*
_output_shapes
:*8
_class.
,*loc:@batch_normalization_2/moving_variance*
valueB:
�
<batch_normalization_2/moving_variance/Initializer/ones/ConstConst*8
_class.
,*loc:@batch_normalization_2/moving_variance*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
6batch_normalization_2/moving_variance/Initializer/onesFillFbatch_normalization_2/moving_variance/Initializer/ones/shape_as_tensor<batch_normalization_2/moving_variance/Initializer/ones/Const*8
_class.
,*loc:@batch_normalization_2/moving_variance*
_output_shapes
:*
T0
�
%batch_normalization_2/moving_variance
VariableV2*8
_class.
,*loc:@batch_normalization_2/moving_variance*
shape:*
dtype0*
_output_shapes
:
�
,batch_normalization_2/moving_variance/AssignAssign%batch_normalization_2/moving_variance6batch_normalization_2/moving_variance/Initializer/ones*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
_output_shapes
:
�
*batch_normalization_2/moving_variance/readIdentity%batch_normalization_2/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
_output_shapes
:
�
$batch_normalization_2/FusedBatchNormFusedBatchNormconv2d_2/BiasAddbatch_normalization_2/Constbatch_normalization_2/beta/read&batch_normalization_2/moving_mean/read*batch_normalization_2/moving_variance/read*
T0*
is_training( *G
_output_shapes5
3:���������::::*
epsilon%��'7
b
batch_normalization_2/Const_1Const*
valueB
 *B`�;*
dtype0*
_output_shapes
: 
n
Relu_2Relu$batch_normalization_2/FusedBatchNorm*
T0*/
_output_shapes
:���������
`
Reshape_1/shapeConst*
valueB"�����  *
dtype0*
_output_shapes
:
`
	Reshape_1ReshapeRelu_2Reshape_1/shape*(
_output_shapes
:����������	*
T0
�
/dense/kernel/Initializer/truncated_normal/shapeConst*
_class
loc:@dense/kernel*
valueB"�  �   *
dtype0*
_output_shapes
:
�
.dense/kernel/Initializer/truncated_normal/meanConst*
_class
loc:@dense/kernel*
valueB
 *    *
dtype0*
_output_shapes
: 
�
0dense/kernel/Initializer/truncated_normal/stddevConst*
_class
loc:@dense/kernel*
valueB
 *���=*
dtype0*
_output_shapes
: 
�
9dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal/dense/kernel/Initializer/truncated_normal/shape*
dtype0* 
_output_shapes
:
�	�*
T0*
_class
loc:@dense/kernel
�
-dense/kernel/Initializer/truncated_normal/mulMul9dense/kernel/Initializer/truncated_normal/TruncatedNormal0dense/kernel/Initializer/truncated_normal/stddev* 
_output_shapes
:
�	�*
T0*
_class
loc:@dense/kernel
�
)dense/kernel/Initializer/truncated_normalAdd-dense/kernel/Initializer/truncated_normal/mul.dense/kernel/Initializer/truncated_normal/mean*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
�	�
�
dense/kernel
VariableV2*
_class
loc:@dense/kernel*
shape:
�	�*
dtype0* 
_output_shapes
:
�	�
�
dense/kernel/AssignAssigndense/kernel)dense/kernel/Initializer/truncated_normal*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
�	�
w
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
�	�
�
,dense/bias/Initializer/zeros/shape_as_tensorConst*
_class
loc:@dense/bias*
valueB:�*
dtype0*
_output_shapes
:
�
"dense/bias/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *
_class
loc:@dense/bias*
valueB
 *    
�
dense/bias/Initializer/zerosFill,dense/bias/Initializer/zeros/shape_as_tensor"dense/bias/Initializer/zeros/Const*
T0*
_class
loc:@dense/bias*
_output_shapes	
:�
s

dense/bias
VariableV2*
dtype0*
_output_shapes	
:�*
_class
loc:@dense/bias*
shape:�
�
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
T0*
_class
loc:@dense/bias*
_output_shapes	
:�
l
dense/bias/readIdentity
dense/bias*
_output_shapes	
:�*
T0*
_class
loc:@dense/bias
g
dense/MatMulMatMul	Reshape_1dense/kernel/read*
T0*(
_output_shapes
:����������
j
dense/BiasAddBiasAdddense/MatMuldense/bias/read*(
_output_shapes
:����������*
T0
�
<batch_normalization_3/beta/Initializer/zeros/shape_as_tensorConst*-
_class#
!loc:@batch_normalization_3/beta*
valueB:�*
dtype0*
_output_shapes
:
�
2batch_normalization_3/beta/Initializer/zeros/ConstConst*-
_class#
!loc:@batch_normalization_3/beta*
valueB
 *    *
dtype0*
_output_shapes
: 
�
,batch_normalization_3/beta/Initializer/zerosFill<batch_normalization_3/beta/Initializer/zeros/shape_as_tensor2batch_normalization_3/beta/Initializer/zeros/Const*
_output_shapes	
:�*
T0*-
_class#
!loc:@batch_normalization_3/beta
�
batch_normalization_3/beta
VariableV2*-
_class#
!loc:@batch_normalization_3/beta*
shape:�*
dtype0*
_output_shapes	
:�
�
!batch_normalization_3/beta/AssignAssignbatch_normalization_3/beta,batch_normalization_3/beta/Initializer/zeros*
T0*-
_class#
!loc:@batch_normalization_3/beta*
_output_shapes	
:�
�
batch_normalization_3/beta/readIdentitybatch_normalization_3/beta*
T0*-
_class#
!loc:@batch_normalization_3/beta*
_output_shapes	
:�
�
Cbatch_normalization_3/moving_mean/Initializer/zeros/shape_as_tensorConst*4
_class*
(&loc:@batch_normalization_3/moving_mean*
valueB:�*
dtype0*
_output_shapes
:
�
9batch_normalization_3/moving_mean/Initializer/zeros/ConstConst*4
_class*
(&loc:@batch_normalization_3/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
�
3batch_normalization_3/moving_mean/Initializer/zerosFillCbatch_normalization_3/moving_mean/Initializer/zeros/shape_as_tensor9batch_normalization_3/moving_mean/Initializer/zeros/Const*
_output_shapes	
:�*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean
�
!batch_normalization_3/moving_mean
VariableV2*4
_class*
(&loc:@batch_normalization_3/moving_mean*
shape:�*
dtype0*
_output_shapes	
:�
�
(batch_normalization_3/moving_mean/AssignAssign!batch_normalization_3/moving_mean3batch_normalization_3/moving_mean/Initializer/zeros*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
_output_shapes	
:�
�
&batch_normalization_3/moving_mean/readIdentity!batch_normalization_3/moving_mean*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
_output_shapes	
:�
�
Fbatch_normalization_3/moving_variance/Initializer/ones/shape_as_tensorConst*8
_class.
,*loc:@batch_normalization_3/moving_variance*
valueB:�*
dtype0*
_output_shapes
:
�
<batch_normalization_3/moving_variance/Initializer/ones/ConstConst*8
_class.
,*loc:@batch_normalization_3/moving_variance*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
6batch_normalization_3/moving_variance/Initializer/onesFillFbatch_normalization_3/moving_variance/Initializer/ones/shape_as_tensor<batch_normalization_3/moving_variance/Initializer/ones/Const*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
_output_shapes	
:�
�
%batch_normalization_3/moving_variance
VariableV2*
dtype0*
_output_shapes	
:�*8
_class.
,*loc:@batch_normalization_3/moving_variance*
shape:�
�
,batch_normalization_3/moving_variance/AssignAssign%batch_normalization_3/moving_variance6batch_normalization_3/moving_variance/Initializer/ones*
_output_shapes	
:�*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance
�
*batch_normalization_3/moving_variance/readIdentity%batch_normalization_3/moving_variance*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
_output_shapes	
:�
j
%batch_normalization_3/batchnorm/add/yConst*
valueB
 *��'7*
dtype0*
_output_shapes
: 
�
#batch_normalization_3/batchnorm/addAdd*batch_normalization_3/moving_variance/read%batch_normalization_3/batchnorm/add/y*
_output_shapes	
:�*
T0
y
%batch_normalization_3/batchnorm/RsqrtRsqrt#batch_normalization_3/batchnorm/add*
_output_shapes	
:�*
T0
�
#batch_normalization_3/batchnorm/mulMuldense/BiasAdd%batch_normalization_3/batchnorm/Rsqrt*(
_output_shapes
:����������*
T0
�
%batch_normalization_3/batchnorm/mul_1Mul&batch_normalization_3/moving_mean/read%batch_normalization_3/batchnorm/Rsqrt*
T0*
_output_shapes	
:�
�
#batch_normalization_3/batchnorm/subSubbatch_normalization_3/beta/read%batch_normalization_3/batchnorm/mul_1*
T0*
_output_shapes	
:�
�
%batch_normalization_3/batchnorm/add_1Add#batch_normalization_3/batchnorm/mul#batch_normalization_3/batchnorm/sub*(
_output_shapes
:����������*
T0
h
Relu_3Relu%batch_normalization_3/batchnorm/add_1*(
_output_shapes
:����������*
T0
W
dropout/IdentityIdentityRelu_3*
T0*(
_output_shapes
:����������
�
/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"�   
   *
dtype0*
_output_shapes
:
�
-dense_1/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_1/kernel*
valueB
 *l-�*
dtype0*
_output_shapes
: 
�
-dense_1/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_1/kernel*
valueB
 *l->*
dtype0*
_output_shapes
: 
�
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	�
*
T0*!
_class
loc:@dense_1/kernel
�
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
�
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	�

�
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
:	�
*
T0*!
_class
loc:@dense_1/kernel
�
dense_1/kernel
VariableV2*!
_class
loc:@dense_1/kernel*
shape:	�
*
dtype0*
_output_shapes
:	�

�
dense_1/kernel/AssignAssigndense_1/kernel)dense_1/kernel/Initializer/random_uniform*
_output_shapes
:	�
*
T0*!
_class
loc:@dense_1/kernel
|
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	�

�
.dense_1/bias/Initializer/zeros/shape_as_tensorConst*
_class
loc:@dense_1/bias*
valueB:
*
dtype0*
_output_shapes
:
�
$dense_1/bias/Initializer/zeros/ConstConst*
_class
loc:@dense_1/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
�
dense_1/bias/Initializer/zerosFill.dense_1/bias/Initializer/zeros/shape_as_tensor$dense_1/bias/Initializer/zeros/Const*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

u
dense_1/bias
VariableV2*
dtype0*
_output_shapes
:
*
_class
loc:@dense_1/bias*
shape:

�
dense_1/bias/AssignAssigndense_1/biasdense_1/bias/Initializer/zeros*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

q
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

q
dense_1/MatMulMatMuldropout/Identitydense_1/kernel/read*'
_output_shapes
:���������
*
T0
o
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*'
_output_shapes
:���������

U
SoftmaxSoftmaxdense_1/BiasAdd*'
_output_shapes
:���������
*
T0
R
ArgMax/dimensionConst*
dtype0*
_output_shapes
: *
value	B :
Y
ArgMaxArgMaxSoftmaxArgMax/dimension*
T0*#
_output_shapes
:���������
Q
CastCastArgMax*

DstT0*#
_output_shapes
:���������*

SrcT0	
P

save/ConstConst*
_output_shapes
: *
valueB Bmodel*
dtype0
�
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_3f7f60cb419e4ba0a323c25468c36ffa/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
�
save/SaveV2/tensor_namesConst"/device:CPU:0*�
value�B�Bbatch_normalization/betaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBbatch_normalization_3/betaB!batch_normalization_3/moving_meanB%batch_normalization_3/moving_varianceBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelBconv2d_2/biasBconv2d_2/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_step*
dtype0*
_output_shapes
:
�
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbatch_normalization/betabatch_normalization/moving_mean#batch_normalization/moving_variancebatch_normalization_1/beta!batch_normalization_1/moving_mean%batch_normalization_1/moving_variancebatch_normalization_2/beta!batch_normalization_2/moving_mean%batch_normalization_2/moving_variancebatch_normalization_3/beta!batch_normalization_3/moving_mean%batch_normalization_3/moving_varianceconv2d/biasconv2d/kernelconv2d_1/biasconv2d_1/kernelconv2d_2/biasconv2d_2/kernel
dense/biasdense/kerneldense_1/biasdense_1/kernelglobal_step"/device:CPU:0*%
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*
N*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
�
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*�
value�B�Bbatch_normalization/betaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBbatch_normalization_3/betaB!batch_normalization_3/moving_meanB%batch_normalization_3/moving_varianceBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelBconv2d_2/biasBconv2d_2/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_step*
dtype0*
_output_shapes
:
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*p
_output_shapes^
\:::::::::::::::::::::::*%
dtypes
2	
�
save/AssignAssignbatch_normalization/betasave/RestoreV2*
T0*+
_class!
loc:@batch_normalization/beta*
_output_shapes
:
�
save/Assign_1Assignbatch_normalization/moving_meansave/RestoreV2:1*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
_output_shapes
:
�
save/Assign_2Assign#batch_normalization/moving_variancesave/RestoreV2:2*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
_output_shapes
:
�
save/Assign_3Assignbatch_normalization_1/betasave/RestoreV2:3*
_output_shapes
:*
T0*-
_class#
!loc:@batch_normalization_1/beta
�
save/Assign_4Assign!batch_normalization_1/moving_meansave/RestoreV2:4*4
_class*
(&loc:@batch_normalization_1/moving_mean*
_output_shapes
:*
T0
�
save/Assign_5Assign%batch_normalization_1/moving_variancesave/RestoreV2:5*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
_output_shapes
:
�
save/Assign_6Assignbatch_normalization_2/betasave/RestoreV2:6*
T0*-
_class#
!loc:@batch_normalization_2/beta*
_output_shapes
:
�
save/Assign_7Assign!batch_normalization_2/moving_meansave/RestoreV2:7*4
_class*
(&loc:@batch_normalization_2/moving_mean*
_output_shapes
:*
T0
�
save/Assign_8Assign%batch_normalization_2/moving_variancesave/RestoreV2:8*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
_output_shapes
:
�
save/Assign_9Assignbatch_normalization_3/betasave/RestoreV2:9*
T0*-
_class#
!loc:@batch_normalization_3/beta*
_output_shapes	
:�
�
save/Assign_10Assign!batch_normalization_3/moving_meansave/RestoreV2:10*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
_output_shapes	
:�
�
save/Assign_11Assign%batch_normalization_3/moving_variancesave/RestoreV2:11*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
_output_shapes	
:�
}
save/Assign_12Assignconv2d/biassave/RestoreV2:12*
T0*
_class
loc:@conv2d/bias*
_output_shapes
:
�
save/Assign_13Assignconv2d/kernelsave/RestoreV2:13*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
:
�
save/Assign_14Assignconv2d_1/biassave/RestoreV2:14*
T0* 
_class
loc:@conv2d_1/bias*
_output_shapes
:
�
save/Assign_15Assignconv2d_1/kernelsave/RestoreV2:15*&
_output_shapes
:*
T0*"
_class
loc:@conv2d_1/kernel
�
save/Assign_16Assignconv2d_2/biassave/RestoreV2:16* 
_class
loc:@conv2d_2/bias*
_output_shapes
:*
T0
�
save/Assign_17Assignconv2d_2/kernelsave/RestoreV2:17*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:*
T0
|
save/Assign_18Assign
dense/biassave/RestoreV2:18*
T0*
_class
loc:@dense/bias*
_output_shapes	
:�
�
save/Assign_19Assigndense/kernelsave/RestoreV2:19*
_class
loc:@dense/kernel* 
_output_shapes
:
�	�*
T0

save/Assign_20Assigndense_1/biassave/RestoreV2:20*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

�
save/Assign_21Assigndense_1/kernelsave/RestoreV2:21*
_output_shapes
:	�
*
T0*!
_class
loc:@dense_1/kernel
y
save/Assign_22Assignglobal_stepsave/RestoreV2:22*
T0	*
_class
loc:@global_step*
_output_shapes
: 
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22
-
save/restore_allNoOp^save/restore_shard

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_all_tables^init_1
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_17c11001646b40da896e3953855b0fd8/part*
dtype0*
_output_shapes
: 
j
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
_output_shapes
: 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
�
save_1/SaveV2/tensor_namesConst"/device:CPU:0*�
value�B�Bbatch_normalization/betaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBbatch_normalization_3/betaB!batch_normalization_3/moving_meanB%batch_normalization_3/moving_varianceBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelBconv2d_2/biasBconv2d_2/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_step*
dtype0*
_output_shapes
:
�
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesbatch_normalization/betabatch_normalization/moving_mean#batch_normalization/moving_variancebatch_normalization_1/beta!batch_normalization_1/moving_mean%batch_normalization_1/moving_variancebatch_normalization_2/beta!batch_normalization_2/moving_mean%batch_normalization_2/moving_variancebatch_normalization_3/beta!batch_normalization_3/moving_mean%batch_normalization_3/moving_varianceconv2d/biasconv2d/kernelconv2d_1/biasconv2d_1/kernelconv2d_2/biasconv2d_2/kernel
dense/biasdense/kerneldense_1/biasdense_1/kernelglobal_step"/device:CPU:0*%
dtypes
2	
�
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
�
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*
N
{
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0
�
save_1/IdentityIdentitysave_1/Const^save_1/control_dependency^save_1/MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 
�
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*�
value�B�Bbatch_normalization/betaBbatch_normalization/moving_meanB#batch_normalization/moving_varianceBbatch_normalization_1/betaB!batch_normalization_1/moving_meanB%batch_normalization_1/moving_varianceBbatch_normalization_2/betaB!batch_normalization_2/moving_meanB%batch_normalization_2/moving_varianceBbatch_normalization_3/betaB!batch_normalization_3/moving_meanB%batch_normalization_3/moving_varianceBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelBconv2d_2/biasBconv2d_2/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_step
�
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
�
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*%
dtypes
2	*p
_output_shapes^
\:::::::::::::::::::::::
�
save_1/AssignAssignbatch_normalization/betasave_1/RestoreV2*
_output_shapes
:*
T0*+
_class!
loc:@batch_normalization/beta
�
save_1/Assign_1Assignbatch_normalization/moving_meansave_1/RestoreV2:1*
T0*2
_class(
&$loc:@batch_normalization/moving_mean*
_output_shapes
:
�
save_1/Assign_2Assign#batch_normalization/moving_variancesave_1/RestoreV2:2*
T0*6
_class,
*(loc:@batch_normalization/moving_variance*
_output_shapes
:
�
save_1/Assign_3Assignbatch_normalization_1/betasave_1/RestoreV2:3*
T0*-
_class#
!loc:@batch_normalization_1/beta*
_output_shapes
:
�
save_1/Assign_4Assign!batch_normalization_1/moving_meansave_1/RestoreV2:4*4
_class*
(&loc:@batch_normalization_1/moving_mean*
_output_shapes
:*
T0
�
save_1/Assign_5Assign%batch_normalization_1/moving_variancesave_1/RestoreV2:5*
T0*8
_class.
,*loc:@batch_normalization_1/moving_variance*
_output_shapes
:
�
save_1/Assign_6Assignbatch_normalization_2/betasave_1/RestoreV2:6*
T0*-
_class#
!loc:@batch_normalization_2/beta*
_output_shapes
:
�
save_1/Assign_7Assign!batch_normalization_2/moving_meansave_1/RestoreV2:7*
T0*4
_class*
(&loc:@batch_normalization_2/moving_mean*
_output_shapes
:
�
save_1/Assign_8Assign%batch_normalization_2/moving_variancesave_1/RestoreV2:8*
T0*8
_class.
,*loc:@batch_normalization_2/moving_variance*
_output_shapes
:
�
save_1/Assign_9Assignbatch_normalization_3/betasave_1/RestoreV2:9*
T0*-
_class#
!loc:@batch_normalization_3/beta*
_output_shapes	
:�
�
save_1/Assign_10Assign!batch_normalization_3/moving_meansave_1/RestoreV2:10*
T0*4
_class*
(&loc:@batch_normalization_3/moving_mean*
_output_shapes	
:�
�
save_1/Assign_11Assign%batch_normalization_3/moving_variancesave_1/RestoreV2:11*
T0*8
_class.
,*loc:@batch_normalization_3/moving_variance*
_output_shapes	
:�
�
save_1/Assign_12Assignconv2d/biassave_1/RestoreV2:12*
T0*
_class
loc:@conv2d/bias*
_output_shapes
:
�
save_1/Assign_13Assignconv2d/kernelsave_1/RestoreV2:13*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
:
�
save_1/Assign_14Assignconv2d_1/biassave_1/RestoreV2:14*
T0* 
_class
loc:@conv2d_1/bias*
_output_shapes
:
�
save_1/Assign_15Assignconv2d_1/kernelsave_1/RestoreV2:15*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
:
�
save_1/Assign_16Assignconv2d_2/biassave_1/RestoreV2:16*
_output_shapes
:*
T0* 
_class
loc:@conv2d_2/bias
�
save_1/Assign_17Assignconv2d_2/kernelsave_1/RestoreV2:17*
T0*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:
�
save_1/Assign_18Assign
dense/biassave_1/RestoreV2:18*
_output_shapes	
:�*
T0*
_class
loc:@dense/bias
�
save_1/Assign_19Assigndense/kernelsave_1/RestoreV2:19*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
�	�
�
save_1/Assign_20Assigndense_1/biassave_1/RestoreV2:20*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

�
save_1/Assign_21Assigndense_1/kernelsave_1/RestoreV2:21*
_output_shapes
:	�
*
T0*!
_class
loc:@dense_1/kernel
}
save_1/Assign_22Assignglobal_stepsave_1/RestoreV2:22*
_output_shapes
: *
T0	*
_class
loc:@global_step
�
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8" 
global_step

global_step:0"�
	variables��
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
k
conv2d/kernel:0conv2d/kernel/Assignconv2d/kernel/read:02,conv2d/kernel/Initializer/truncated_normal:0
X
conv2d/bias:0conv2d/bias/Assignconv2d/bias/read:02conv2d/bias/Initializer/zeros:0
�
batch_normalization/beta:0batch_normalization/beta/Assignbatch_normalization/beta/read:02,batch_normalization/beta/Initializer/zeros:0
�
!batch_normalization/moving_mean:0&batch_normalization/moving_mean/Assign&batch_normalization/moving_mean/read:023batch_normalization/moving_mean/Initializer/zeros:0
�
%batch_normalization/moving_variance:0*batch_normalization/moving_variance/Assign*batch_normalization/moving_variance/read:026batch_normalization/moving_variance/Initializer/ones:0
s
conv2d_1/kernel:0conv2d_1/kernel/Assignconv2d_1/kernel/read:02.conv2d_1/kernel/Initializer/truncated_normal:0
`
conv2d_1/bias:0conv2d_1/bias/Assignconv2d_1/bias/read:02!conv2d_1/bias/Initializer/zeros:0
�
batch_normalization_1/beta:0!batch_normalization_1/beta/Assign!batch_normalization_1/beta/read:02.batch_normalization_1/beta/Initializer/zeros:0
�
#batch_normalization_1/moving_mean:0(batch_normalization_1/moving_mean/Assign(batch_normalization_1/moving_mean/read:025batch_normalization_1/moving_mean/Initializer/zeros:0
�
'batch_normalization_1/moving_variance:0,batch_normalization_1/moving_variance/Assign,batch_normalization_1/moving_variance/read:028batch_normalization_1/moving_variance/Initializer/ones:0
s
conv2d_2/kernel:0conv2d_2/kernel/Assignconv2d_2/kernel/read:02.conv2d_2/kernel/Initializer/truncated_normal:0
`
conv2d_2/bias:0conv2d_2/bias/Assignconv2d_2/bias/read:02!conv2d_2/bias/Initializer/zeros:0
�
batch_normalization_2/beta:0!batch_normalization_2/beta/Assign!batch_normalization_2/beta/read:02.batch_normalization_2/beta/Initializer/zeros:0
�
#batch_normalization_2/moving_mean:0(batch_normalization_2/moving_mean/Assign(batch_normalization_2/moving_mean/read:025batch_normalization_2/moving_mean/Initializer/zeros:0
�
'batch_normalization_2/moving_variance:0,batch_normalization_2/moving_variance/Assign,batch_normalization_2/moving_variance/read:028batch_normalization_2/moving_variance/Initializer/ones:0
g
dense/kernel:0dense/kernel/Assigndense/kernel/read:02+dense/kernel/Initializer/truncated_normal:0
T
dense/bias:0dense/bias/Assigndense/bias/read:02dense/bias/Initializer/zeros:0
�
batch_normalization_3/beta:0!batch_normalization_3/beta/Assign!batch_normalization_3/beta/read:02.batch_normalization_3/beta/Initializer/zeros:0
�
#batch_normalization_3/moving_mean:0(batch_normalization_3/moving_mean/Assign(batch_normalization_3/moving_mean/read:025batch_normalization_3/moving_mean/Initializer/zeros:0
�
'batch_normalization_3/moving_variance:0,batch_normalization_3/moving_variance/Assign,batch_normalization_3/moving_variance/read:028batch_normalization_3/moving_variance/Initializer/ones:0
m
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02+dense_1/kernel/Initializer/random_uniform:0
\
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02 dense_1/bias/Initializer/zeros:0" 
legacy_init_op


group_deps"�
trainable_variables��
k
conv2d/kernel:0conv2d/kernel/Assignconv2d/kernel/read:02,conv2d/kernel/Initializer/truncated_normal:0
X
conv2d/bias:0conv2d/bias/Assignconv2d/bias/read:02conv2d/bias/Initializer/zeros:0
�
batch_normalization/beta:0batch_normalization/beta/Assignbatch_normalization/beta/read:02,batch_normalization/beta/Initializer/zeros:0
s
conv2d_1/kernel:0conv2d_1/kernel/Assignconv2d_1/kernel/read:02.conv2d_1/kernel/Initializer/truncated_normal:0
`
conv2d_1/bias:0conv2d_1/bias/Assignconv2d_1/bias/read:02!conv2d_1/bias/Initializer/zeros:0
�
batch_normalization_1/beta:0!batch_normalization_1/beta/Assign!batch_normalization_1/beta/read:02.batch_normalization_1/beta/Initializer/zeros:0
s
conv2d_2/kernel:0conv2d_2/kernel/Assignconv2d_2/kernel/read:02.conv2d_2/kernel/Initializer/truncated_normal:0
`
conv2d_2/bias:0conv2d_2/bias/Assignconv2d_2/bias/read:02!conv2d_2/bias/Initializer/zeros:0
�
batch_normalization_2/beta:0!batch_normalization_2/beta/Assign!batch_normalization_2/beta/read:02.batch_normalization_2/beta/Initializer/zeros:0
g
dense/kernel:0dense/kernel/Assigndense/kernel/read:02+dense/kernel/Initializer/truncated_normal:0
T
dense/bias:0dense/bias/Assigndense/bias/read:02dense/bias/Initializer/zeros:0
�
batch_normalization_3/beta:0!batch_normalization_3/beta/Assign!batch_normalization_3/beta/read:02.batch_normalization_3/beta/Initializer/zeros:0
m
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02+dense_1/kernel/Initializer/random_uniform:0
\
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02 dense_1/bias/Initializer/zeros:0*�
classes�
1
image(
Placeholder:0���������/
predictions 
	Softmax:0���������
$
classes
Cast:0���������tensorflow/serving/predict*�
serving_default�
1
image(
Placeholder:0���������/
predictions 
	Softmax:0���������
$
classes
Cast:0���������tensorflow/serving/predict