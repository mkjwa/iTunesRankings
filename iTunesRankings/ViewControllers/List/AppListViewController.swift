//
//  AppListViewController.swift
//  iTunesRankings
//
//  Created by RetinaFish on 27/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit
import ObjectMapper

class AppListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingView: UIView!
    
    private var entryList:[Entry] = []
    
    private let genreCode = 6015        // Finance
    private let limit = 200
    
    // MARK: - Netowork
    
    private func loadAppList(_ finishHandler:@escaping (_ entry:[Entry], _ success:Bool) -> Void) {
        NetworkManager.shared().request(APIs.category(genre:genreCode, limit:limit)) { (response, error) in
            if let result = response {
                let feed = result["feed"] as! [String:Any]
                let results = feed["entry"]
                let entryArray = Mapper<Entry>().mapArray(JSONArray: results as! [[String : Any]])
                finishHandler(entryArray, true)
            } else {
                finishHandler([], false)
            }
        }
    }
    
    // MARK: - Callback
    
    @objc private func reloadData() {
        loadAppList { (results, success) in
            self.entryList = results
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Local Methods
    
    private func setNavigatioTitle(_ title:String) {
        self.navigationItem.title = title
    }
    
    // MARK:- Initialize
    
    private func initialize() {
        setNavigatioTitle("Finance")
        setRightNavigationButton()
        loadingView.setResizeFitInSuperview()
        tableView.tableFooterView = UIView()
    }
    
    private func setRightNavigationButton() {
        let button = UIButton(type: .system)
        button.setTitle("Reload", for: .normal)
        button.addTarget(self, action: #selector(reloadData), for: UIControlEvents.touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
        reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AppListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = entryList.count
        
        if count > 0 {
            self.tableView.backgroundView = nil
        } else {
            self.tableView.backgroundView = loadingView
        }
        
        
        return count
    }
    
    // MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppItemTableViewCell")! as! AppItemTableViewCell
        
        let index = indexPath.row
        
        if index < self.entryList.count {
            let entryItem = entryList[index]
            let thumbnailUrl = ((entryItem.image.first)?.label)!
         
            cell.setInfo(title: entryItem.title, release: (entryItem.releaseDate?.date)!)
            cell.setImage(thumbnailUrl)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        if index < self.entryList.count {
            let entryItem = entryList[index]
            
            let detailViewController = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            detailViewController.setTarget(title: entryItem.name, appId: (entryItem.appId?.id)!)
            
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
            
    }
    
    
    
}
