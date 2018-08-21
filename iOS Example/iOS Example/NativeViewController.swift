//
//  NativeViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit
import ADTiming

class NativeViewController: UIViewController {
    
    private lazy var nativeView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var mainView: UIImageView = {
        let main = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        return main
    }()
    
    private lazy var logoView: UIImageView = {
        let main = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        return main
    }()
    
    private lazy var titleView: UILabel = {
        let l = UILabel(frame: CGRect(x: 0, y: 270, width: UIScreen.main.bounds.size.width, height: 15))
        l.font = UIFont.systemFont(ofSize: 13)
        return l
    }()
    
    private lazy var bodyView: UILabel = {
        let l = UILabel(frame: CGRect(x: 0, y: 285, width: UIScreen.main.bounds.size.width, height: 15))
        l.font = UIFont.systemFont(ofSize: 13)
        return l
    }()
    
    var nativeItem: ATNativeItem?
    
    private lazy var atNativeView: ATNativeView = {
        let view = ATNativeView(frame: CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 300))
        return view
    }()
    
    private lazy var nativeLoader: ATNativeLoader = {
        let loader = ATNativeLoader()
        loader.placementId = "109"
        loader.rootViewController = self
        loader.delegate = self
        return loader
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func addView() {
        nativeView.addSubview(mainView)
        nativeView.addSubview(logoView)
        nativeView.addSubview(titleView)
        nativeView.addSubview(bodyView)
    }

    func reloadView() {
        mainView.sd_setImage(with: URL(string: nativeItem?.imageUrl ?? ""))
        logoView.sd_setImage(with: URL(string: nativeItem?.iconUrl ?? ""))
        titleView.text = nativeItem?.title
        bodyView.text = nativeItem?.body
    }
    
    @IBAction func load(_ sender: Any) {
        nativeLoader.load()
    }
    
    @IBAction func show(_ sender: Any) {
        addView()
        reloadView()
        atNativeView.addAd(nativeView)
        self.view.addSubview(atNativeView)
        atNativeView.update(item: nativeItem)
        nativeLoader.attach(atNativeView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NativeViewController: ATNativeLoaderDelegate {
    func atNativeDidLoad(_ native: ATNativeLoader, item: ATNativeItem) {
        nativeItem = item
        print("nativeAdDidLoad")
    }
    
    func atNative(_ native: ATNativeLoader, failWithError error: NSError) {
        print("nativeAddidFail")
    }
    
    func atNativeWillExposure(_ native: ATNativeLoader) {
        print("nativeAdWillExposure")
    }
    
    func atNativeDidClick(_ native: ATNativeLoader) {
        print("nativeAdDidClick")
    }
}
