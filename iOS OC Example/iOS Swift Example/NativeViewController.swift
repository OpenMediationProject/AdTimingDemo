//
//  NativeViewController.swift
//  iOS Swift Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

import UIKit
import AdTimingSDK

class NativeViewController: UIViewController, AdTimingNativeDelegate {

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
    
    var nativeAd: AdTimingNativeAd?
    
    private lazy var adtNativeView: AdTimingNativeView = {
        let view = AdTimingNativeView(frame: CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 300))
        view.mediaView = AdTimingNativeMediaView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        view.addSubview(view.mediaView)
        view.addSubview(self.iconView)
        view.addSubview(self.titleLabel)
        view.addSubview(self.bodyLabel)
        
        return view
    }()
    
    private lazy var native: AdTimingNative = {
        let native = AdTimingNative(placementID: "109")
        native.delegate = self
        self.view.addSubview(adtNativeView)
        return native
    }()
    
    var logLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Native"
        self.view.backgroundColor = UIColor.white
        
        let loadBtn:UIButton = UIButton(frame: CGRect(x: 20, y: 120, width: 120, height: 30))
        loadBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        loadBtn.backgroundColor = UIColor.white
        loadBtn.setTitleColor(UIColor.blue, for: .normal)
        loadBtn.setTitleColor(UIColor.gray, for: .highlighted)
        loadBtn.setTitleColor(UIColor.gray, for: .selected)
        loadBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        loadBtn.setTitle("Load", for: .normal)
        loadBtn.addTarget(self, action: #selector(loadBtnDidClicked), for: .touchUpInside)
        self.view.addSubview(loadBtn)
        
        let showBtn:UIButton = UIButton(frame: CGRect(x: 20, y: loadBtn.frame.maxY+20, width: 120, height: 30))
        showBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        showBtn.backgroundColor = UIColor.white
        showBtn.setTitleColor(UIColor.blue, for: .normal)
        showBtn.setTitleColor(UIColor.gray, for: .highlighted)
        showBtn.setTitleColor(UIColor.gray, for: .selected)
        showBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        showBtn.setTitle("Show", for: .normal)
        showBtn.addTarget(self, action: #selector(showBtnDidClicked), for: .touchUpInside)
        self.view.addSubview(showBtn)
        
        logLabel = UILabel(frame: CGRect(x: 20, y: showBtn.frame.maxY+20, width: 120, height: 30))
        logLabel.text = "Log"
        logLabel.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(logLabel)
    }

    @objc func loadBtnDidClicked(){
        self.native.loadAd()
    }
    
    @objc func showBtnDidClicked(){
        self.adtNativeView.isHidden = false
        self.adtNativeView.nativeAd = self.nativeAd!
        self.iconView.image = UIImage(data: try! Data(contentsOf: URL(string: self.nativeAd?.iconUrl ?? "")!))
        self.titleLabel.text = self.nativeAd?.title
        self.bodyLabel.text = self.nativeAd?.body
    }
    
    func adtimingNative(_ native: AdTimingNative, didLoad nativeAd: AdTimingNativeAd) {
        print("nativeAd load success")
        self.nativeAd = nativeAd;
        self.logLabel.text = "load success"
    }
    
    func adtimingNative(_ native: AdTimingNative, didFailWithError error: Error) {
        print("nativeAddidFail")
        self.logLabel.text = "load fail"
    }
    
    func adtimingNativeWillExposure(_ native: AdTimingNative) {
        print("nativeAdWillExposure")
        self.logLabel.text = ""
    }
    
    func adtimingNativeDidClick(_ native: AdTimingNative) {
        print("nativeAdDidClick")
    }
    

}


