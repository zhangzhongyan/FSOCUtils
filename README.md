# FSOCUtils

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/FSOCUtils.svg)](https://img.shields.io/cocoapods/v/FSOCUtils.svg)
[![Platform](https://img.shields.io/cocoapods/p/FSOCUtils.svg?style=flat)](http://cocoadocs.org/docsets/FSOCUtils)

Object-c 工具基础组件

## 如何安装
- [下载Zip包](https://github.com/zhangzhongyan/FSOCUtils/archive/master.zip) 将FSOCUtils文件夹内源码copy到项目集成
- 通过Pod进行安装：

```ruby
pod 'FSOCUtils'
```

### 自定义安装
```ruby
pod 'FSOCUtils/CountDownUtils'
pod 'FSOCUtils/EncyptUtils'
pod 'FSOCUtils/JSONUtils'
pod 'FSOCUtils/SafeUtils'
```


## 说明

* `FSOCUtils/CountDownUtils`
  - /// 开始倒计时
  - (void)startCountDownWithCount:(NSUInteger)count;
  - /// 停止倒计时
  - (void)stopCountDown;
  - /// 倒计时变更Block(回调)
  - @property (nonatomic, copy, nullable) void (^countDownChangeBlock) (NSUInteger countDown)

  
* `FSOCUtils/EncyptUtils `
  - /// 先AES加密、然后Base64编码
  - + (nullable NSString *)encryptWithString:(nullable NSString *)content key:(nullable NSString *)key;
  - /// 先Base64解码、后AES加密
  - + (nullable NSString *)decryptWithString:(nullable NSString *)content key:(nullable NSString *)key;
 

* `FSOCUtils/JSONUtils `
  - ///  扩展MJExtension，增加可传nil
  - + (instancetype)fs_objectWithKeyValues:(nullable id)keyValues;

* `FSOCUtils/SafeUtils `
  - 拓展NSArray+FSSafe（安全存取）
  - 拓展NSDictionary+FSSafe（安全存取）
  - 拓展NSMutableArray+FSSafe（安全存取）
  - 拓展NSMutableDictionary+FSSafe（安全存取）
  - 拓展NSString+FSSafe（安全存取）


