//
//  NativeViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit


class NativeViewController: UIViewController {
    
    private lazy var iconView: UIImageView = {
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        return icon
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 270, width: UIScreen.main.bounds.size.width, height: 15))
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    
    private lazy var bodyLabel: UILabel = {
        let bodyLabel = UILabel(frame: CGRect(x: 0, y: 285, width: UIScreen.main.bounds.size.width, height: 15))
        bodyLabel.font = UIFont.systemFont(ofSize: 13)
        return bodyLabel
    }()
    
    var nativeAd: ADTNativeAd?
    
    private lazy var adtNativeView: ADTNativeView = {
        let view = ADTNativeView(frame: CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 300))
        view.mediaView = ADTNativeMediaView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        view.addSubview(view.mediaView)
        view.addSubview(self.iconView)
        view.addSubview(self.titleLabel)
        view.addSubview(self.bodyLabel)
        
        return view
    }()
    
    private lazy var native: ADTNative = {
        let native = ADTNative(placmentID: "109")
        native.delegate = self
        return native
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.adtNativeView)
    }
    
    @IBAction func load(_ sender: Any) {
        self.native.loadAd()
    }
    
    @IBAction func show(_ sender: Any) {
        self.adtNativeView.isHidden = false
        self.adtNativeView.nativeAd = self.nativeAd!
        self.iconView.image = UIImage(data: try! Data(contentsOf: URL(string: self.nativeAd?.iconUrl ?? "")!))
        self.titleLabel.text = self.nativeAd?.title
        self.bodyLabel.text = self.nativeAd?.body
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NativeViewController: ADTNativeDelegate {
    func adtNativeDidload(_ nativeAd: ADTNativeAd) {
        self.nativeAd = nativeAd
    }
    
    func adtNativeDidFail(toLoad error: Error) {
        print("nativeAddidFail")
    }
    
    func adtNativeWillShow() {
        print("nativeAdWillExposure")
    }
    
    func adtNativeDidClick() {
        print("nativeAdDidClick")
    }
    
}
