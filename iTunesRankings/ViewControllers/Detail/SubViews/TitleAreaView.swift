//
//  TitleAreaView.swift
//  iTunesRankings
//
//  Created by RetinaFish on 28/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class TitleAreaView: UIView {
    @IBOutlet var appIconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingCountLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!

    // MARK:- Open Methods
    
    open func setAppIcon(_ url:String) {
        self.appIconImageView.setImgUrl(url)
    }
    
    open func setInfo(title:String, company:String, ratings:Float, count:Int, category:String, age:String) {
        self.titleLabel.text = title
        self.companyLabel.text = company
        self.ratingLabel.text =  NSString(format: "%.1f", ratings) as String
        self.ratingCountLabel.text = "\(count) Ratings"
        self.categoryLabel.text = category
        self.ageLabel.text = age
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
