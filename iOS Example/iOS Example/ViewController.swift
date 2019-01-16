//
//  ViewController.swift
//  iOS Example
//
//  Created by 公司 on 2018/6/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableData = ["Native",
                     "Banner",
                     "Video",
                     "Interstitial"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "native", sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: "banner", sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: "video", sender: nil)
            break
        case 3:
            self.performSegue(withIdentifier: "interstitial", sender: nil)
            break
        default:
            break
        }
    }
}

