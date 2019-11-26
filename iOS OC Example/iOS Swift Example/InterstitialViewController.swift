//
//  InterstitialViewController.swift
//  iOS Swift Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

import UIKit
import AdTimingSDK
class InterstitialViewController: UIViewController, AdTimingInterstitialAdDelegate {
    
    var logLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Interstitial"
        self.view.backgroundColor = UIColor.white
            
        let showBtn:UIButton = UIButton(frame: CGRect(x: 20, y: 120, width: 120, height: 30))
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
    
    @objc func showBtnDidClicked(){
        if AdTimingInterstitialAd.sharedInstance().isReady() {
            AdTimingInterstitialAd.sharedInstance().show(with: self, scene: "")
        }
    }
    
    func adtimingInterstitialChangedAvailability(_ available: Bool) {
        if available {
           print("Ad is Available")
        }
    }
    
    func adtimingInterstitialDidOpen(_ scene: AdTimingScene) {
        print("Ad is Open")
    }
    
    func adtimingInterstitialDidShow(_ scene: AdTimingScene) {
        print("AdStartPlay")
    }
    
    func adtimingInterstitialDidClick(_ scene: AdTimingScene) {
        print("AdDidClick")
    }
        
    func adtimingInterstitialDidClose(_ scene: AdTimingScene) {
        print("AdDidClose")
    }
    
    func adtimingInterstitialDidFail(toShow scene: AdTimingScene, withError error: Error) {
        print("AdFailedToPlay")
    }
}
