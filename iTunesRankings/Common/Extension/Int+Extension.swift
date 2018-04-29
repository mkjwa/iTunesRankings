//
//  Int+Extension.swift
//  iTunesRankings
//
//  Created by RetinaFish on 29/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation

extension Int {
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var withSeparator: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
