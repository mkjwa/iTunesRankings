//
//  DescriptionView.swift
//  iTunesRankings
//
//  Created by RetinaFish on 28/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: - Button Action
    
    @IBAction func moreAction(_ sender: UIButton) {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        moreButton.isHidden = true
    }
    
    // MARK: - Open Methods
    
    open func setDescription(_ message:String) {
        descriptionLabel.text = message
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
