//
//  InterstitialViewController.swift
//  iOS Swift Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

import UIKit
import AdTiming
class InterstitialViewController: UIViewController, ADTInterstitialDelegate {

    private lazy var interstitial: ADTInterstitial = {
        let interstitial = ADTInterstitial(placementID: "121")
        interstitial.delegate = self
        return interstitial
    }()
    
    var logLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Interstitial"
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
        interstitial.load()
    }
    
    @objc func showBtnDidClicked(){
        interstitial.show()
    }

    func adtInterstitialDidLoad(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdDidLoad")
        self.logLabel.text = "load success"
    }
    
    func adtInterstitial(_ adtInterstitial: ADTInterstitial, didFailWithError error: Error) {
        print("interstitialAddidFail")
        self.logLabel.text = "load fail"
    }
    
    func adtInterstitialWillExposure(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdWillExposure")
        self.logLabel.text = ""
    }
    
    func adtInterstitialDidClick(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdDidClick")
    }
    
    func adtInterstitialDidClose(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdDidClose")
    }
    
}
