//
//  BannerViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit
import ADTiming

class BannerViewController: UIViewController {

    private lazy var bannerView: ATBannerView = {
        let view = ATBannerView(frame: CGRect(x: 50, y: 300, width: 0, height: 0), adSize: .normal)
        view.placementId = "541"
        view.rootViewController = self
        view.delegate = self
        return view
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
        self.view.addSubview(bannerView)
        bannerView.loadAndShow()
    }
    

}

extension BannerViewController: ATBannerViewDelegate {
    func atBannerDidLoad(_ banner: ATBannerView) {
        print("bannerAdDidLoad")
        /* if you have use tencent ads
         DispatchQueue.main.async {
         print("bannerAdDidLoad")
         }
         */
    }
    func atBanner(_ banner: ATBannerView, failWithError error: NSError) {
        print("bannerAddidFail")
    }
    
    func atBannerWillExposure(_ banner: ATBannerView) {
        print("bannerAdWillExposure")
        /* if you have use tencent ads
         DispatchQueue.main.async {
         print("bannerAdWillExposure")
         }
         */
    }
    
    func atBannerDidClick(_ banner: ATBannerView) {
        print("bannerAdDidClick")
    }
}
