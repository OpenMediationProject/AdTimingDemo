//
//  BannerViewController.swift
//  iOS Swift Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

import UIKit
import AdTiming

class BannerViewController: UIViewController, ADTBannerDelegate {

    private lazy var banner: ADTBanner = {
        let banner = ADTBanner(bannerType: ADTBannerType.smart, placementID: "111")
        banner.add(.horizontally, constant: 0)
        banner.add(.vertically, constant: 0)
        banner.delegate = self
        self.view.addSubview(banner)
        return banner
    }()
    
    var logLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Banner"
        self.view.backgroundColor = UIColor.white
        
        var loadBtn = UIButton.init(type: UIButton.ButtonType.system)
        loadBtn = UIButton(frame: CGRect(x: 20, y: 120, width: 120, height: 30))
        loadBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        loadBtn.backgroundColor = UIColor.white
        loadBtn.setTitleColor(UIColor.blue, for: .normal)
        loadBtn.setTitleColor(UIColor.gray, for: .highlighted)
        loadBtn.setTitleColor(UIColor.gray, for: .selected)
        loadBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        loadBtn.setTitle("Load&Show", for: .normal)
        loadBtn.addTarget(self, action: #selector(loadBtnDidClicked), for: .touchUpInside)
        self.view.addSubview(loadBtn)
        
        logLabel = UILabel(frame: CGRect(x: 20, y: loadBtn.frame.maxY+20, width: 120, height: 30))
        logLabel.text = "Log"
        logLabel.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(logLabel)
        
    }
    
    @objc func loadBtnDidClicked(){
        banner.loadAndShow()
    }

    func adtBannerDidLoad(_ banner: ADTBanner) {
        print("bannerAdDidLoad")
        logLabel.text = "load success"
    }
    
    func adtBanner(_ banner: ADTBanner, didFailWithError error: Error) {
        print("bannerAddidFail")
        logLabel.text = "load fail"
    }
    
    func adtBannerWillExposure(_ banner: ADTBanner) {
        print("bannerAdWillExposure")
        logLabel.text = ""
    }
    
    func adtBannerDidClick(_ banner: ADTBanner) {
        print("bannerAdDidClick")
    }

    
}



