![DinPay logo](http://oq3ai2jdz.bkt.clouddn.com/DPApplePaySDK%E5%85%AC%E5%8F%B8logo.png)
# DPApplePaySDK
* 使用智付 ApplePay 支付 SDK 可快速、方便集成苹果官方的 ApplePay 功能。

## SDK集成流程详解

### 接入准备

*  需要接入的商户向智付商务人员申请并开通 ApplePay 支付，获取商户 ID，密钥 Key，下载 ApplePay 所需的 csr。到 Apple 开发者平台通过智付下载的 csr 注册 ApplePay 支付的商家号。

### 开发流程图

![开发流程图](http://oq3ai2jdz.bkt.clouddn.com/DPApplePaySDK%E6%B5%81%E7%A8%8B%E5%9B%BE.png)

### DPApplePaySDK 文件结构说明

![文件结构说明](http://oq3ai2jdz.bkt.clouddn.com/DPApplePaySDK%E6%96%87%E4%BB%B6%E7%BB%93%E6%9E%84.png)

### DPApplePaySDK依赖关系

* 处于功能需求的需要，DPApplePaySDK 集成需要以下动态库: libxml2.tbd 和 libicucore.tbd，智付 DPApplePaySDK 依赖 openssl,请将 openssl 导入工程并正确配置 openssl 的路径，Xcode6 以下需要导入以下系统的 Framework 库 SystemConfiguration.framework。

### iOS 9 设置

*  由于 Apple 在 iOS9 系统上的要求，APP 需要在 info.plist 文件中设置以下的参数: DPApplePaySDK 本身是支持 https 的。

![iOS 9 设置](http://oq3ai2jdz.bkt.clouddn.com/DPApplePaySDKiOS%209%E9%85%8D%E7%BD%AE.png)

### DPApplePaySDK 集成

* 请在你的工程目录结构中，右键选择 Add -> Existing Files…，选择文件 DPApplePay.framework 或者将文件拖入 Xcode 工程目录结构中，在弹出的界面中勾选 Copy items into destination group's folder(if needed),并确保 Add To Targets 勾选相应的 target。

## 功能使用

* 在需要调用支付的控制器页面导入![头文件](http://oq3ai2jdz.bkt.clouddn.com/DPApplePaySDK%E5%A4%B4%E6%96%87%E4%BB%B6.png)
头文件。

### 验证是否支持 ApplePay

* 在调用 ApplePa y支付前需要先调用用下面的方法判断当前设备是否支持 ApplePay。返回 YES 则是支持 ApplePay，返回 NO 则当前设备不支持 ApplePay。手机要求 iPhone SE，iPhone 6 且手机系统版本要高于等于 iOS 9.3。

``` objective-c
/**
 *  是否支持ApplePay
 *
 *  @return YES - 支持  NO －不支持
 */
+(BOOL)canMakeApplePay;

```

### 支付接口

* 支付接口如下，调用智付 ApplePay 支付接口需要从智付网关预下单获取智付 Token。将 Token，智付公钥，商家到 Apple 开发者中心申请的 ApplePay 的商家 ID，启动支付控件的控制器传入 SDK，并实现代理方法接收支付结果。

~~~ objective-c
/**
 *  开始支付
 *
 *  @param token   支付后台返回的流水号
 *  @param key   智付公钥
 *  @param merchantID   从Apple开发者中心申请的ApplePay的商家ID
 *  @param viewController 启动支付控件的viewController
 *  @param delegate 实现 DPApplePayResultDelegate 方法的 UIViewController
 */
+(void)payWithToken:(NSString *)token
               key:(NSString *)key
        merchantID:(NSString *)merchantID
    viewController:(UIViewController *)viewController
          delegate:(id<DPApplePayResultDelegate>)delegate;

~~~


### 支付结果

* 支付结果通过代理返回

~~~ objective-c
/**
 *  支付结果回调函数
 *
 *  @param payResult 
 */
-(void)applePayResult:(DPApplePayResult *)payResult;

~~~

* 返回的结果为DPApplePayResult 对象，支付结果对象包含以下三个参数,payDesc 为支付结果成功或者失败返回的提示信息，otherInfo 为其余信息，可能为空 payResultStatus 为支付状态成功失败或者其它情况，该状态为枚举类型，状态码如下，用户根据不同的状态做处理。

``` objective-c
/** 支付状态 */
@property DPApplePayResultStatus payResultStatus;
/** 信息 */
@property (nonatomic,strong) NSString *payDesc;
/** 其它信息 */
@property (nonatomic,strong) NSString *otherInfo;

```
* 其中需要注意的是 DPApplePayResultStatusUnknowCancel，支付交易已经发起，未获取到支付结果，或者用户将弹框收起导致无法看到支付结果的，用户需要查询相应的订单状态以确定是否支付成功。

``` objective-c
/** 支付状态 */
typedef NS_ENUM(NSInteger, DPApplePayResultStatus) {
   
    DPApplePayResultStatusSuccess,  //支付成功
    DPApplePayResultStatusFailure,  //支付失败
    DPApplePayResultStatusUnknownCancel,  //交易已发起，状态不确定，商户需查询商户后台确认支付状态 
    DPApplePayResultStatusCancel,  //支付取消
    DPApplePayResultStatusParamError, //参数错误
    DPApplePayResultStatusInitError, //初始化失败
    DPApplePayResultStatusUnSupposeApplePay, //不支持ApplePay
};

```

## 注意事项

* 导入智付 ApplePaySDK 如编译有异常请先确保该动态库添加请添加动态库 libicucore.tbd 和libxml.tbd.
