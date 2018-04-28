//
//  ViewController.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {
    
    @IBAction func runAction(_ sender: UIButton) {
        NetworkManager.shared().request(APIs.category(genre:6015, limit:50)) { (response, error) in
            if let result = response {
                let feed = result["feed"] as! [String:Any]
                let results = feed["entry"]
                let entry = Mapper<Entry>().mapArray(JSONArray: results as! [[String : Any]])
    
                print("\(entry)")
            }
        }
    }
    
    // MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

