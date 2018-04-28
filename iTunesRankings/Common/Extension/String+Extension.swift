//
//  String+Extension.swift
//  iTunesRankings
//
//  Created by RetinaFish on 28/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation

extension String {
    func toFormattedDate(_ formatted:String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = formatted
        dateFormatter.locale = tempLocale // reset the locale
        
        return  dateFormatter.string(from: date)
    }
}
