//
//  InterstitialViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit
import ADTiming

class InterstitialViewController: UIViewController {

    private lazy var interstitial: ATInterstitial = {
        let inter = ATInterstitial("121")
        inter.delegate = self
        return inter
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
        interstitial.show(self)
    }
    
}

extension InterstitialViewController: ATInterstitialDelegate {
    func atInterstitialDidLoad(_ interstitial: ATInterstitial) {
        print("interstitialAdDidLoad")
    }
    
    func atInterstitial(_ interstitial: ATInterstitial, failWithError error: NSError) {
        print("interstitialAddidFail")
    }
    
    func atInterstitialWillExposure(_ interstitial: ATInterstitial) {
        print("interstitialAdWillExposure")
    }
    
    func atInterstitialDidClick(_ interstitial: ATInterstitial) {
        print("interstitialAdDidClick")
    }
    
    func atInterstitialDidClose(_ interstitial: ATInterstitial) {
        print("interstitialAdDidClose")
    }
}
