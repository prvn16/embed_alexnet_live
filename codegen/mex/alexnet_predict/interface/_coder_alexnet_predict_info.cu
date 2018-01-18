/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_alexnet_predict_info.cu
 *
 * Code generation for function '_coder_alexnet_predict_info'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "alexnet_predict.h"
#include "_coder_alexnet_predict_info.h"

/* Function Definitions */
mxArray *emlrtMexFcnProperties()
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * fldNames[4] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs" };

  mxArray *xInputs;
  const char * b_fldNames[4] = { "Version", "ResolvedFunctions", "EntryPoints",
    "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 4, fldNames);
  xInputs = emlrtCreateLogicalMatrix(1, 1);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("alexnet_predict"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", emlrtMxCreateDoubleScalar
                (1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  xResult = emlrtCreateStructMatrix(1, 1, 4, b_fldNames);
  emlrtSetField(xResult, 0, "Version", emlrtMxCreateString(
    "9.3.0.713579 (R2017b)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char * data[22] = {
    "789ced5d4d6ce3c615e6b69b4d1745db2041db0445da34288214db5ab6d6b6ec5c6249962c796d4bd68fffd2ad97a246122d724851a42de512f7d0a2bd1441d1"
    "4b811ef658042850e4d200bdb8e8a5c82987b487a228f6d64b81f4d2b34b897ad64f342bdaa2c8a5f406d8a5e9b77cdfccb76fde9b79c3e170b792dbb7388efb",
    "aaf9a7757df227ae5dbe625db8173ad72f70fd65507eab73fdcec03d94e7b8db7dcf81fcb79daba0509d3474eb461229d931e402d1cc1bcacbe44a4d519145ca"
    "533dd75409a791ba229d92625b521225921365b2a5f4dc2444f3468ef788ae6e5aa2d6cfd10a11aa5943e6b44abd5b5da9f786ebe1e731a3fdb76df2b3cae0a7",
    "f5ef2edfebcadf893d8cbe1530eba51a1a0d945543508a442b125939e625d2a0443f96c45312801b55234551d0e7e481fa3e62d4e78ecdfa0e5ea1dce5bed473"
    "37b70678e70c7d76f979958107fc80bc4dc79ca4f0c57542d42dc26b54a4e51da29f295a951bdd7ebbf5b93d70dfadcfed767d840adf32d22bbc8b31f18e9978",
    "56fb41fe4ef2a06d21694d296bbcfc5acb94eb81ed706e2b1c096482f30ba142405714a9a0340275b38ea4186853d6f9fb9e7561f0675a918bf6a3ff27fff7b0"
    "bbf6ea76fff00eafc1d067d71ebfc1c0037b0439d979b0b798e7855221de5c2aed6f14d633ca4abc5b8ff4089c51f5e018f76ee9bf603c8ffdbabff4db616ccd",
    "6d3bb4e282192fe7c4fa866ac4285f905a238471e3c16061d5038a53767338020fe4ced8cd3d93b8402f711e8c27ce7ff9ebb7311ef83d1e94f2c2c9ea02a92f"
    "d68485d34c7843cba4aba7098c07a0ef88a11f7804b9d9afa376fb35cc12ba3f74baf5b050a0f6b7e711a3becedae17fdf06bc9f33f4d9e5ef75061ef007722b",
    "1e88e6e452a3bc3427f3bac417a2e62fcb8426785a943a734ba7e60bcf33ebf57cbb5e06ad52e58c7a30aed8b26f48c3220350181842a1694c2ec687bbff7c88"
    "f1c1eff1a1192ea795cdec41b09c150bb9b87ec097d70fd6313eccf47ce13cee581ee915061ef007722b3e0ccf21b58a5ff3483338bef8f8673fc6b8e0f7b810",
    "cecd879ac9ccf2492991d9db5336c2ebe5e5780ce3c20cf76bae77dec0c2b3cbdf730cbc174c498b3fd210ebad5528affcfee331f1d69878967d80dcb48fed88"
    "5d03b186fc0189a7e5409ba039d9bdffff279797979fb9e8d7670b6f5cbffe75061ed81bc81bfab221e9e9985c5ba68a5259cced8adb210efdfa24fd3a7bbc1f",
    "6b5893f975a2125a24546842a2d7ddf17e777d00f3416ecf1b311f74333cabcc0a1ee6839cd1ff57c6f37679e419fa8147908f39eeeffe74d5bfef09940604a3"
    "4869581561f8efd9f87f5c7b7c9981073c82dc8a139f8f937e8d0bb337be387fef5fbff814e3c284f0dc9a37ec2f49f3bc51499545f16827566bea292d2171d3",
    "13173e613c6f97c713867ee011e4ce8df73693b9aca1aa8aa693e2907eee717e08e711388f18d61e9c47788b87f30867f4e33c6278bbae1b27de67e8b3cbe30f"
    "1978c023c807e2c4d38327e75dbcc071c8d3db67c3be307e4c10cfadf871bf1ebc9fe5a307856029b32806158d4f556ab88f61a279043fad3f9f33f4d9e5efdb",
    "0c3ce00fe44045377498e1730ec2a777fb1970fc31bc5d36ec08df4f9a209e5bf1211a4909dbe57ceea891b9bf20edf30fc26a231dc1f880f1c1193b7c898107"
    "fc81bcbbcfad6aba3722950cdafebd5771e1a31be281febd11782077709fdb1571adb50917ede537fa97310ef83d0e9413d5c2913e1f2a24434b62ac99282fec",
    "2757a3d31307b03f0fbf4261ed5b18d7febec9c003de40def5ff65a2f76c74f6eb3ee76b8c1b9cb2973ee23c78ff8dfe2a8471c0ef7120b5b35bdfcc1c04178d"
    "a55c234c55b576964a61be08e7039c33f9a267651fdb607906e3c2b4d80fe689268887fbd89cd17fc1781efb757f99d43eb651ebbb629dd40c5ef2ccefffe186",
    "78a0ffc1083c90b7d6936d4f08882c0524b100fbd98864fe10e830d59900b8f8bed147fffbc7dfd0cf4f08cf2d3f9fcdd70c7d27b9b797cf647797b55a38b144"
    "785c0f403f3f02ef59f3f3a0ffcec07d17ef4e1bafa81885d6bbade8e7875fa1a09f77070ffdbc33fab11f0faf7fbfddbd7695e75719faecf2c5faff01be406e",
    "5270dc69f1b1a068c42b3f7f3126de43269ed55e90b7ec233d9e81a89a78caeb2430485ddb625cf4fb3ff9f84dcce3f8ddefc7960bab3b27f174733f5eca96f6"
    "63a9d0c26115bf633ac3fdba55de746cbdf77afb91af5e06a5bc5616a950a9fa35afffa3117820bfd678e1290bbe57af815e31670d205c8c072fbd95c1fdc87e",
    "8f07cdc65972958f97ca4bf3422aa6644fe246e80cf3facf6cbf66d9855d3bfc22a33d773bd797fb7efbfa9a757da373fdc19a53e3f551dfad2b498ad2fa909c"
    "5ff34049269e6537201f6ffe583268a0cd9417e724fd39ff06e681fceeff576aa154ae26ad2f552395dcee4656afadaf0b53f4be0ff6e3e1f567e581ce19faec",
    "f2c53a2f0ff802f9c0f85fac470c51d29374c79089260a9ef9fd71df133e60e259ed07f9b5eda5f5e773838441dadcfc8ee9f91f711dc0fffe3f755a8b864b89"
    "d395dcee625388c934183f92a6281f84fe7f78fdfbedee7b8ef9ff6f31f0802f900ff8ffbac04bbc3607a37effeefbca8fc003b933feff9ec55b8fedb8e8ff3f",
    "d87f05fdbfdffd7fa1b29c3ea0925ecc2a72cca089fb8558647303fdffacfafff719faecf2f57d061ef005f201ffcfabaad4ccb69d59dca0822e2a3449d3122f"
    "c051d94ead537f6d44fd405eead4e2b8627dfc0ef0c7fd5e4461043ec89d890f6c5a3dd81f16fde912ae1ffb3d5e6c6d3e100e6be9d5f0e1f6a2560faa62f034",
    "b489dfa3c3fedd2e7353378ff02a8f84f38849e1596556f0701ee18cfe4f18cfdbe55162e8071e413ed1f78abe0bb75677ef6ddf2346fd1db5cbb547aead1f8b"
    "75ca530ed78fedbc7f6c32e5c1bc13f7114c12cfadf30c6a6123252f360f16e7335ad0882e90d55379879b1ebf8ffd7878fd27b57e80ebc72c3c5c3f1e0fcf2a",
    "b38287ebc7cee8bf603c8ffb85fb8b67fb85a91eaceb9a6fbf0bb135020fe4e38c0f4c7e5a0b4c1daadcde27c0bd3887dfff7966fdbcdd71fe61bca89c14e3d4"
    "58ad6c9c448aa9954a723ec7a19f473fef2f3fef553e07fdbce378ed322b78e8e79dd18ffd7878fd27b58e8bf91c161ee673c6c3b3caace0613ec719fde8ff87",
    "d7bfdfee42eeedf325a77ceff9d737c51b2c76f3378f6f8807fad746e081dc9cf76d47ecda43c70e249e96036d82dcf4e34f2e2f2f3f73d18fcf169e6bef6986"
    "d2da6afe2c9d514b4791c38cbe1f2faec4a6e87d9c0bc6f398afe92f5ee56ba8217b9a97ffdd0df1407f74041ec8af737e4b7f78ef30d4310417ed60f383a93e",
    "d7f7fcf7fffe8b77f310d7ce6de4d54af52c533c2c4604b5f4ee6eec5db2793845e7755d309e47ffde5f26754ecbab0c3ce00fe4dd73bbae7237d6b965495975"
    "625c6f37de484a59147abe1bede2b9be4e9ddfd54de37419f4e25cdf930f318feffbf890d9ae8b49a55a4ac4685e95570c636f95cf4dd1f79db17f0f6fd775e3",
    "049eef783dbc1b8c2ff07cc79be1b5cbace0e1f98ee3e9ff3fa7178aa1", "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(data, 48120U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/* End of code generation (_coder_alexnet_predict_info.cu) */
