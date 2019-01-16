//
//  BannerViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit


class BannerViewController: UIViewController {
    
    private lazy var banner: ADTBanner = {
        let banner = ADTBanner(bannerType: ADTBannerType.default, placementID: "541")
        banner.add(.horizontally, constant: 0)
        banner.add(.vertically, constant: 0)
        banner.delegate = self
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadshow(_ sender: Any) {
        self.view.addSubview(banner)
        banner.loadAndShow()
    }
    
    
}

extension BannerViewController: ADTBannerDelegate {
    func adtBannerDidLoad(_ adtBanner: ADTBanner) {
        print("bannerAdDidLoad")
        /* if you have use tencent ads
         DispatchQueue.main.async {
         print("bannerAdDidLoad")
         }
         */
    }
    
    func adtBanner(_ adtBanner: ADTBanner, didFailWithError error: Error) {
        print("bannerAddidFail")
    }
    
    func adtBannerWillExposure(_ adtBanner: ADTBanner) {
        print("bannerAdWillExposure")
        /* if you have use tencent ads
         DispatchQueue.main.async {
         print("bannerAdWillExposure")
         }
         */
    }
    
    func adtBannerDidClick(_ adtBanner: ADTBanner) {
        print("bannerAdDidClick")
    }
    
}
