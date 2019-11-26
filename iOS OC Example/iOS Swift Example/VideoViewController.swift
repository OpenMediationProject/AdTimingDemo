//
//  VideoViewController.swift
//  iOS Swift Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

import UIKit
import AdTimingSDK

class VideoViewController: UIViewController, AdTimingRewardedVideoDelegate {

    var logLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Video"
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
        if AdTimingRewardedVideoAd.sharedInstance().isReady() {
            AdTimingRewardedVideoAd.sharedInstance().show(with: self, scene: "")
        }
    }
    
    func adtimingRewardedVideoChangedAvailability(_ available: Bool) {
        if available {
           print("VideoAd is Available")
        }
    }
    
    func adtimingRewardedVideoDidOpen(_ scene: AdTimingScene) {
        print("VideoAd is Open")
    }
    
    func adtimingRewardedVideoPlayStart(_ scene: AdTimingScene) {
        print("videoAdStartPlay")
    }
    
    func adtimingRewardedVideoDidClick(_ scene: AdTimingScene) {
        print("videoAdDidClick")
    }

    func adtimingRewardedVideoPlayEnd(_ scene: AdTimingScene) {
        print("videoAdPlayEnd")    }
    
    func adtimingRewardedVideoDidClose(_ scene: AdTimingScene) {
        print("videoAdDidClose")
    }

    func adtimingRewardedVideoDidReceiveReward(_ scene: AdTimingScene) {
        print("videoAdReceiveReward")
    }
    
    func adtimingRewardedVideoDidFail(toShow scene: AdTimingScene, withError error: Error) {
        print("videoAdFailedToPlay")
    }
}
