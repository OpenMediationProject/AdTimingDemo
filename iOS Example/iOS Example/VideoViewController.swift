//
//  VideoViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit

class VideoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func load(_ sender: Any) {
        ADTVideoAd.sharedInstance().delegate = self
        ADTVideoAd.sharedInstance().load(withPlacmentID: "113")
    }
    
    @IBAction func show(_ sender: Any) {
        ADTVideoAd.sharedInstance().isReady("113")
        ADTVideoAd.sharedInstance().show("113")
    }
    
}

extension VideoViewController: ADTVideoAdDelegate {
    func adtVideoAdDidload(_ placementID: String) {
        print("videoAdDidLoad")
    }
    
    func adtVideoAdDidFail(toLoad error: Error) {
        print("videoAdShowFail")
    }
    
    func adtVideoAdDidStart() {
        print("VideoAdStartPlay")
    }
    
    func adtVideoAdDidClick() {
        print("videoAdDidClick")
    }
    
    func adtVideoAdDidFinish(_ state: ADTVideoAdFinishState) {
        if state == .skipped {
            print("VideoAdSkipped")
        } else if state == .completed {
            print("VideoAdCompleted")
        }
    }
}
