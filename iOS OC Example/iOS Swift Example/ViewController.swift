//
//  ViewController.swift
//  iOS Swift Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mainTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        mainTableView = UITableView(frame: self.view.bounds)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.view.addSubview(mainTableView)
        mainTableView.rowHeight = 50
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Banner"
        }else if indexPath.row == 1 {
            cell.textLabel?.text = "Native"
        }else if indexPath.row == 2 {
            cell.textLabel?.text = "Interstitial"
        }else if indexPath.row == 3 {
            cell.textLabel?.text = "Video"
        }else if indexPath.row == 4 {
            cell.textLabel?.text = "Interactive"
        }
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            self.navigationController?.pushViewController(BannerViewController(), animated: true)
            
        }else if indexPath.row == 1 {
            self.navigationController?.pushViewController(NativeViewController(), animated: true)
            
        }else if indexPath.row == 2 {
            self.navigationController?.pushViewController(InterstitialViewController(), animated: true)
            
        }else if indexPath.row == 3 {
            self.navigationController?.pushViewController(VideoViewController(), animated: true)
            
        }else if indexPath.row == 4 {
            self.navigationController?.pushViewController(InteractiveViewController(), animated: true)
            
        }
        
        
    }
    
    
    
}

