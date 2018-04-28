//
//  AppItemTableViewCell.swift
//  iTunesRankings
//
//  Created by RetinaFish on 27/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class AppItemTableViewCell: UITableViewCell {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseLabel: UILabel!

    private var imgUrl:String = ""
    private var title:String = ""
    private var releaseDate:String = ""
    private var summary:String = ""
    
    // MARK:- Button Action

    // MARK:- Open Methods
    
    open func setImage(_ url:String) {
        self.thumbnailImageView.setImgUrl(url)
    }
    
    open func setInfo(title:String, release:String) {
        self.titleLabel.text = title
        self.releaseLabel.text = release
       // self.title = title
       // self.releaseDate = release
       // self.summary = summary
    }
    
    // MARK:- View Initialize
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        releaseLabel.text = ""
        thumbnailImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
