//
//  ReleaseNoteView.swift
//  iTunesRankings
//
//  Created by RetinaFish on 28/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class ReleaseNoteView: UIView {
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    
    // MARK:- Open Methods
    
    open func setNotes(_ note:String, version:String, release:String) {
        notesLabel.text = note
        versionLabel.text = "Version \(version)"
        releaseDateLabel.text = release.toFormattedDate("yyyy-MM-dd")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
