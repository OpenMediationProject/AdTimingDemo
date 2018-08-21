# 使用方法

## 原生广告

### 创建 View 和 Loader

Swift

```swift
var nativeItem: ATNativeItem?

private lazy var atNativeView: ATNativeView = {
    let native = ATNativeView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.size.width, height: 300))
    native.update(item: nativeItem)
    return native
}()
    
private lazy var nativeLoader: ATNativeLoader = {
    let loader = ATNativeLoader()
    loader.placementId = "YOUR_PLACEMENT_ID"
    loader.rootViewController = self
    loader.delegate = self
    return loader
}()
```
Objective-C

```objectivec
@property (nonatomic , strong)ATNativeItem * nativeItem;

ATNativeLoader *loader = [[ATNativeLoader alloc] init];
loader.placementId = @"YOUR_PLACEMENT_ID";
loader.delegate = self;
loader.adType = ATNativeTypeNormal;
loader.rootViewController = self;

ATNativeView * atNativeView = [[ATNativeView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 300)];
[atNativeView updateWithItem:_nativeItem];
```

### 加载广告

Swift

```swift
nativeLoader.load()
```
Objective-C

```objectivec
[_nativeAd load];
```

### 展示广告

Swift

```swift
atNativeView.addAd("YOUR_PERSONAL_NATIVE_VIEW")
self.view.addSubview(atNativeView)
nativeLoader.attach(atNativeView)
```
Objective-C

```objectivec
[_atNativeView addAd:_adView];
[self.view addSubview:_atNativeView];
[_nativeLoader attach:_atNativeView];
```

### 原生广告代理方法(ATNativeLoaderDelegate)

Swift

```swift
func nativeAdDidLoad(_ nativeAd: ATNativeLoader, item: ATNativeItem) {
	print("广告加载完成")
}
    
func nativeAd(_ nativeAd: ATNativeLoader, didFailWithError error: NSError) {
	print("广告加载失败")
}
    
func nativeAdWillExposure(_ nativeAd: ATNativeLoader) {
	print("广告将要展示")
}
    
func nativeAdDidClick(_ nativeAd: ATNativeLoader) {
	print("广告被点击")
}
    
func nativeAdWillLeaveApplication(_ nativeAd: ATNativeLoader) {
	print("将要离开App")
}
```
Objective-C

```objectivec
- (void)nativeAdDidLoad:(ATNativeLoader * _Nonnull)nativeAd item:(ATNativeItem * _Nonnull)item {
    _nativeItem = item;
    NSLog(@"广告加载完成");
}

- (void)nativeAd:(ATNativeLoader * _Nonnull)nativeAd didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"广告加载失败");
}

- (void)nativeAdWillExposure:(ATNativeLoader * _Nonnull)nativeAd {
    NSLog(@"广告将要展示");
}

- (void)nativeAdDidClick:(ATNativeLoader * _Nonnull)nativeAd {
    NSLog(@"广告被点击");
}

- (void)nativeAdWillLeaveApplication:(ATNativeLoader * _Nonnull)nativeAd {
    NSLog(@"将要离开App");
}
```

## 横幅广告

### 创建 View

Swift

```swift
private lazy var bannerView: ATBannerView = {
    let view = ATBannerView(frame: CGPoint(x: 50, y: 300), adSize: .normal)
    view.placementId = "YOUR_PLACEMENT_ID"
    view.rootViewController = self
    view.delegate = self
    return view
}()
```
Objective-C

```objectivec
if (!_bannerView) {
    _bannerView = [[ATBannerView alloc] initWithFrame:CGRectZero adSize:ATBannerTypeNormal];
    _bannerView.placementId = @"YOUR_PLACEMENT_ID";
    _bannerView.delegate = self;
    _bannerView.center = CGPointMake(self.view.center.x, self.view.center.y);
    _bannerView.rootViewController = self;
    [self.view addSubview:_bannerView];
}
```

### 加载&展示广告

Swift

```swift
bannerView.loadAndShow()
```
Objective-C

```objectivec
[_bannerView loadAndShow];
```

### 横幅广告代理方法(ATBannerViewDelegate)

Swift

```swift
func bannerAdDidLoad(_ bannerAd: ATBannerView) {
    print("广告加载完成")
}

func bannerAd(_ bannerAd: ATBannerView, didFailWithError error: NSError) {
    print("广告加载失败")
}

func bannerAdWillExposure(_ bannerAd: ATBannerView) {
    print("广告将要展示")
}

func bannerAdDidClick(_ bannerAd: ATBannerView) {
    print("广告被点击")
}

func bannerAdWillLeaveApplication(_ bannerAd: ATBannerView) {
    print("将要离开App")
}
```
Objective-C

```objectivec
- (void)bannerAdDidLoad:(ATBannerView * _Nonnull)bannerAd {
    NSLog(@"广告加载完成");
}

- (void)bannerAd:(ATBannerView * _Nonnull)bannerAd didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"广告加载失败");
}

- (void)bannerAdWillExposure:(ATBannerView * _Nonnull)bannerAd {
    NSLog(@"广告将要展示");
}

- (void)bannerAdDidClick:(ATBannerView * _Nonnull)bannerAd {
    NSLog(@"广告被点击");
}

- (void)bannerAdWillLeaveApplication:(ATBannerView * _Nonnull)bannerAd {
    NSLog(@"将要离开App");
    
}
```

## 视频广告

### 设置代理

Swift

```swift
ATVideo.shared.delegate = self
```
Objective-C

```objectivec
[[ATVideo shared] setDelegate:self];
```

### 加载广告

Swift

```swift
ATVideo.shared.load("YOUR_PLACEMENT_ID")
```
Objective-C

```objectivec
[[ATVideo shared] load:@"YOUR_PLACEMENT_ID"];
```

### 查询广告是否准备好(可选)

Swift

```swift
ATVideo.shared.isReady("YOUR_PLACEMENT_ID")
```
Objective-C

```objectivec
[[ATVideo shared] isReady:@"YOUR_PLACEMENT_ID"];
```

### 展示广告

Swift

```swift
ATVideo.shared.present(self, placementId: "YOUR_PLACEMENT_ID")
```
Objective-C

```objectivec
[[ATVideo shared] present:self placementId:@"YOUR_PLACEMENT_ID"];
```

### 视频广告代理方法(ATVideoDelegate)

Swift

```swift
func videoAdDidLoad(_ videoAd: ATVideo, placementId: String) {
    print("广告加载完成")
}

func videoAd(_ videoAd: ATVideo, placementId: String, didFailWithError error: NSError) {
    print("广告加载失败")
}

func VideoAdFinishPlay(_ videoAd: ATVideo, placementId: String) {
    print("视频播放完成")
}

func videoAdDidClick(_ videoAd: ATVideo, placementId: String) {
    print("视频被点击")
}
```
Objective-C

```objectivec
- (void)videoAdDidLoad:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId {
    NSLog(@"广告加载完成");
}

- (void)videoAd:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"广告加载失败");
}

- (void)VideoAdFinishPlay:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId {
    NSLog(@"视频播放完成");
}

- (void)videoAdDidClick:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId {
    NSLog(@"视频被点击");
}
```

## 插屏广告

### 创建 View

Swift

```swift
private lazy var interstitial: ATInterstitial = {
    let inter = ATInterstitial("YOUR_PLACEMENT_ID")
    inter.delegate = self
    return inter
}()
```
Objective-C

```objectivec
ATInterstitial *interstitial = [[ATInterstitial alloc] init:@"YOUR_PLACEMENT_ID"];
interstitial.delegate = self;
```

### 加载广告

Swift

```swift
interstitial.load()
```
Objective-C

```objectivec
[_interstitial load];
```

### 展示广告

Swift

```swift
interstitial.show(self)
```
Objective-C

```objectivec
[_interstitial show:self];
```

### 插屏广告代理方法(ATInterstitialDelegate)

Swift

```swift
func interstitialAdDidLoad(_ interstitialAd: ATInterstitial) {
    print("广告加载完成")
}

func interstitialAd(_ interstitialAd: ATInterstitial, didFailWithError error: NSError) {
    print("广告加载失败")
}

func interstitialAdWillClose(_ interstitialAd: ATInterstitial) {
    print("广告将要关闭")
}

func interstitialAdDidClose(_ interstitialAd: ATInterstitial) {
    print("广告已经关闭")
}

func interstitialAdWillExposure(_ interstitialAd: ATInterstitial) {
    print("广告将要展示")
}

func interstitialAdDidClick(_ interstitialAd: ATInterstitial) {
    print("广告被点击")
}

func interstitialAdWillLeaveApplication(_ interstitialAd: ATInterstitial) {
    print("将要离开App")
}
```
Objective-C

```objectivec
- (void)interstitialAdDidLoad:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"广告加载完成");
}

- (void)interstitialAd:(ATInterstitial * _Nonnull)interstitialAd didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"广告加载失败");
}

- (void)interstitialAdWillClose:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"广告将要关闭");
}

- (void)interstitialAdDidClose:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"广告已经关闭");
}

- (void)interstitialAdWillExposure:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"广告将要展示");
}

- (void)interstitialAdDidClick:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"广告被点击");
}

- (void)interstitialAdWillLeaveApplication:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"将要离开App");
}
```
