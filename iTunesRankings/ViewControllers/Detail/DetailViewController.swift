//
//  DetailViewController.swift
//  iTunesRankings
//
//  Created by RetinaFish on 27/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleAreaView: TitleAreaView!
    @IBOutlet weak var screenshotContainer: UIView!
    @IBOutlet weak var releaseNoteView: ReleaseNoteView!
    @IBOutlet weak var descriptionView: DescriptionView!
    
    @IBOutlet weak var loadingView: UIView!
    
    private var screenshotViewController:ScreenshotViewController?
    
    private var appId:String?
    private var titleString:String = ""
    
    private var appInfo:Description?
    
    // MARK: - Button Action
    
    @objc private func backAction() {
        dismissal()
    }
    
    // MARK:- Open Methods
    
    open func setTarget(title:String, appId:String) {
        self.titleString = title
        self.appId = appId
    }
    
    // MARK: - Local Methods
    
    private func setNavigatioTitle(_ title:String) {
        self.navigationItem.title = title
    }
    
    @objc private func dismissal() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Update Info
    
    private func updateInfo(_ desc:Description) {
        appInfo = desc
        
        if let info = appInfo {
            titleAreaView.setInfo(title: info.trackName, company: info.sellerName, ratings: info.averageUserRating, count: info.userRatingCount, category: info.primaryGenreName, age: info.contentAdvisoryRating)
            titleAreaView.setAppIcon(info.artworkUrl60)
            descriptionView.setDescription(info.description)
            releaseNoteView.setNotes(info.releaseNotes, version: info.version, release: info.releaseDate)
        }
        
        if let screenshots = appInfo?.screenshotUrls {
            updateScreenshots(screenshots)
        }
    }
    
    private func updateScreenshots(_ urls:[String]) {
        if let screenshots = screenshotViewController {
            screenshots.setImageUrls(urls)
            screenshots.reload()
        }
    }
    
    // MARK: - Netowork
    
    private func loadDetail(id:String, _ finishHandler:@escaping (_ result:Description?, _ success:Bool) -> Void) {
        NetworkManager.shared().request(APIs.lookup(id: id)) { (response, error) in
            if let results = response {
               // let results = response as! [String:Any]
                let json = (results["results"] as! [[String: AnyObject]])[0]
                let appInfo = Description(JSON: json as [String : Any])
                finishHandler(appInfo, true)
            } else {
                finishHandler(nil, false)
            }
        }
    }
    
    // MARK:- Initialize
    
    private func initialize() {
        setNavigatioTitle(self.titleString)
        setLeftNavigationButton()
        initScreenshotView()
        prepareLoading()
    }
    
    private func prepareLoading() {
        self.view.addSubview(loadingView)
        loadingView.setResizeFitInSuperview()
        self.scrollView.isHidden = true
    }
    
    private func initScreenshotView() {
        screenshotViewController = storyboard!.instantiateViewController(withIdentifier: "ScreenshotViewController") as? ScreenshotViewController
        
        if let screenshots = self.screenshotViewController {
            screenshotContainer.addSubview(screenshots.view)
            screenshots.view.setResizeFitInSuperview()
            addChildViewController(screenshots)
        }
    }
    
    private func setLeftNavigationButton() {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(dismissal), for: UIControlEvents.touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.backBarButtonItem = barButton
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        
        if let lookupId = appId {
            loadDetail(id: lookupId) { (description, finished) in
                self.loadingView.removeFromSuperview()
                self.scrollView.isHidden = false
                self.updateInfo(description!)
            }
        }
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
