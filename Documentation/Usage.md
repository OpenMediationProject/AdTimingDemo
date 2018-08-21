# Usage

## NATIVE

### Create NativeView and Loader

Swift

```swift
var nativeItem: ATNativeItem?

private lazy var atNativeView: ATNativeView = {
    let native = ATNativeView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.size.width, height: 300))
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
```

### loadNative

Swift

```swift
nativeLoader.load()
```
Objective-C

```objectivec
[_nativeAd load];
```

### showNative
Swift

```swift
atNativeView.addAd("YOUR_PERSONAL_NATIVE_VIEW")
self.view.addSubview(atNativeView)
atNativeView.update(item: nativeItem)
nativeLoader.attach(atNativeView)
```
Objective-C

```objectivec
[_atNativeView addAd:_adView];
[self.view addSubview:_atNativeView];
[_atNativeView updateWithItem:_nativeItem];
[_nativeLoader attach:_atNativeView];
```

### NativeDelegate(ATNativeLoaderDelegate)

Swift

```swift
func atNativeDidLoad(_ native: ATNativeLoader, item: ATNativeItem) {
	print("nativeAdDidLoad")
}
    
func atNative(_ native: ATNativeLoader, failWithError error: NSError) {
	print("nativeAd didFail")
}
    
func atNativeWillExposure(_ native: ATNativeLoader) {
	print("nativeAdWillExposure")
}
    
func atNativeDidClick(_ native: ATNativeLoader) {
	print("nativeAdDidClick")
}
```
Objective-C

```objectivec
- (void)atNativeDidLoad:(ATNativeLoader *)native item:(ATNativeItem *)item {
    _nativeItem = item;
    NSLog(@"nativeAdDidLoad");
}

- (void)atNative:(ATNativeLoader *)native failWithError:(NSError *)error {
    NSLog(@"nativeAd didFail");
}

- (void)atNativeWillExposure:(ATNativeLoader *)native {
    NSLog(@"nativeAdWillExposure");
}

- (void)atNativeDidClick:(ATNativeLoader *)native {
    NSLog(@"nativeAdDidClick");
}
```


## Banner

### Create BannerView

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


### Load&ShowBanner

Swift

```swift
bannerView.loadAndShow()
```
Objective-C

```objectivec
[_bannerView loadAndShow];
```

### BannerDelegate(ATBannerViewDelegate)

Swift

```swift
func atBannerDidLoad(_ banner: ATBannerView) {
    /* if you have use tencent ads
     DispatchQueue.main.async {
     print("bannerAdDidLoad")
     }
     */
    print("bannerAdDidLoad")
}

func bannerAd(_ bannerAd: ATBannerView, didFailWithError error: NSError) {
    print("bannerAd didFail")
}

func bannerAdWillExposure(_ bannerAd: ATBannerView) {
    print("bannerAdWillExposure")
}

func bannerAdDidClick(_ bannerAd: ATBannerView) {
    print("bannerAdDidClick")
}
```
Objective-C

```objectivec
- (void)bannerAdDidLoad:(ATBannerView * _Nonnull)bannerAd {
    /* if you have use tencent ads
     DispatchQueue.main.async {
     print("bannerAdDidLoad")
     }
     */
    NSLog(@"bannerAdDidLoad");
}

- (void)bannerAd:(ATBannerView * _Nonnull)bannerAd didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"bannerAd didFail");
}

- (void)bannerAdWillExposure:(ATBannerView * _Nonnull)bannerAd {
    NSLog(@"bannerAdWillExposure");
}

- (void)bannerAdDidClick:(ATBannerView * _Nonnull)bannerAd {
    NSLog(@"bannerAdDidClick");
}
```

## VIDEO

### Setting Video Delegate

Swift

```swift
ATVideo.shared.delegate = self
```
Objective-C

```objectivec
[[ATVideo shared] setDelegate:self];
```

### LoadVideo

Swift

```swift
ATVideo.shared.load("YOUR_PLACEMENT_ID")
```
Objective-C

```objectivec
[[ATVideo shared] load:@"YOUR_PLACEMENT_ID"];
```

### is Ad Ready(Optional)

Swift

```swift
ATVideo.shared.isReady("YOUR_PLACEMENT_ID")
```
Objective-C

```objectivec
[[ATVideo shared] isReady:@"YOUR_PLACEMENT_ID"];
```

### ShowVideo

Swift

```swift
ATVideo.shared.present(self, placementId: "YOUR_PLACEMENT_ID")
```
Objective-C

```objectivec
[[ATVideo shared] present:self placementId:@"YOUR_PLACEMENT_ID"];
```


### VideoDelegate(ATVideoDelegate)

Swift

```swift
func videoAdDidLoad(_ videoAd: ATVideo, placementId: String) {
    print("videoAdDidLoad")
}

func videoAd(_ videoAd: ATVideo, placementId: String, didFailWithError error: NSError) {
    print("videoAd didFail")
}

func VideoAdFinishPlay(_ videoAd: ATVideo, placementId: String) {
    print("VideoAdFinishPlay")
}

func videoAdDidClick(_ videoAd: ATVideo, placementId: String) {
    print("videoAdDidClick")
}
```
Objective-C

```objectivec
- (void)videoAdDidLoad:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId {
    NSLog(@"videoAdDidLoad");
}

- (void)videoAd:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"videoAd didFail");
}

- (void)VideoAdFinishPlay:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId {
    NSLog(@"VideoAdFinishPlay");
}

- (void)videoAdDidClick:(ATVideo * _Nonnull)videoAd placementId:(NSString * _Nonnull)placementId {
    NSLog(@"videoAdDidClick");
}
```

## Interstitial

### Create InterstitialView

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

### LoadInterstitial

Swift

```swift
interstitial.load()
```
Objective-C

```objectivec
[_interstitial load];
```

### ShowInterstitial

Swift

```swift
interstitial.show(self)
```
Objective-C

```objectivec
[_interstitial show:self];
```

### InterstitialDelegate(ATInterstitialDelegate)

Swift

```swift
func interstitialAdDidLoad(_ interstitialAd: ATInterstitial) {
    print("interstitialAdDidLoad")
}

func interstitialAd(_ interstitialAd: ATInterstitial, didFailWithError error: NSError) {
    print("interstitialAd didFail")
}

func interstitialAdDidClose(_ interstitialAd: ATInterstitial) {
    print("interstitialAdDidClose")
}

func interstitialAdWillExposure(_ interstitialAd: ATInterstitial) {
    print("interstitialAdWillExposure")
}

func interstitialAdDidClick(_ interstitialAd: ATInterstitial) {
    print("interstitialAdDidClick")
}
```
Objective-C

```objectivec
- (void)interstitialAdDidLoad:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"interstitialAdDidLoad");
}

- (void)interstitialAd:(ATInterstitial * _Nonnull)interstitialAd didFailWithError:(NSError * _Nonnull)error {
    NSLog(@"interstitialAd didFail");
}

- (void)interstitialAdDidClose:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"interstitialAdDidClose");
}

- (void)interstitialAdWillExposure:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"interstitialAdWillExposure");
}

- (void)interstitialAdDidClick:(ATInterstitial * _Nonnull)interstitialAd {
    NSLog(@"interstitialAdDidClick");
}
```
