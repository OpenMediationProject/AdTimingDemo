//
//  InterstitialViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit
//import ADTiming

class InterstitialViewController: UIViewController {
    
    private lazy var interstitial: ADTInterstitial = {
        let interstitial = ADTInterstitial(placementID: "121")
        interstitial.delegate = self
        return interstitial
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func load(_ sender: Any) {
        interstitial.load()
    }
    
    @IBAction func show(_ sender: Any) {
        interstitial.show()
    }
    
}

extension InterstitialViewController: ADTInterstitialDelegate {
    func adtInterstitialDidLoad(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdDidLoad")
    }
    
    func adtInterstitial(_ adtInterstitial: ADTInterstitial, didFailWithError error: Error) {
        print("interstitialAddidFail")
    }
    
    func adtInterstitialWillExposure(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdWillExposure")
    }
    
    func adtInterstitialDidClick(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdDidClick")
    }
    
    func adtInterstitialDidClose(_ adtInterstitial: ADTInterstitial) {
        print("interstitialAdDidClose")
    }
}
