//
//  VideoViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit
import ADTiming

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ATVideo.shared.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func load(_ sender: Any) {
        ATVideo.shared.load("113")
    }
    
    @IBAction func show(_ sender: Any) {
        ATVideo.shared.present(self, placementId: "113")
    }
    
}

extension VideoViewController: ATVideoDelegate {
    func atVideoDidLoad(_ video: ATVideo, placementId: String) {
        print("videoAdDidLoad")
    }
    
    func atVideo(_ video: ATVideo, placementId: String, failWithShow error: NSError) {
        print("videoAdShowFail")
    }
    
    func atVideoStartPlay(_ video: ATVideo, placementId: String) {
        print("VideoAdStartPlay")
    }
    
    func atVideoFinishPlay(_ video: ATVideo, placementId: String, finishState: ATVideoFinishState) {
        if finishState == .skipped {
            print("VideoAdSkipped")
        } else if finishState == .completed {
            print("VideoAdCompleted")
        }
    }
    
    func atVideoDidClick(_ video: ATVideo, placementId: String) {
        print("videoAdDidClick")
    }
    
    func atVideoDidClose(_ video: ATVideo, placementId: String) {
        print("videoAdDidClose")
    }
}
