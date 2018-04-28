//
//  ScreenshotViewController.swift
//  iTunesRankings
//
//  Created by RetinaFish on 28/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class ScreenshotViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var imgUrlList:[String] = []
    
    // MARK: - Open Methods
    
    open func setImageUrls(_ urls:[String]) {
        imgUrlList = urls
    }
    
    open func reload() {
        collectionView.reloadData()
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

extension ScreenshotViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK:- UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = self.imgUrlList.count
        return count
    }
    
    // MARK:- UICollectionView
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCollectionViewCell",
                                                      for: indexPath) as! ScreenshotCollectionViewCell
        let index = indexPath.row
        
        if index < self.imgUrlList.count {
            let imgUrl = imgUrlList[index]
            cell.setImageUrl(imgUrl)
        }
        
        return cell
    }
}
