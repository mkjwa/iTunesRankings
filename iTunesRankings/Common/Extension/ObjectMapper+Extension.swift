//
//  Mappable+Extension.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation
import ObjectMapper

extension Mappable {
    static func ObjectToJSON(_ object: [String:Any]?) -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: object!, options: [])
        let decoded = String(data: jsonData, encoding: .utf8)!
        
        return decoded
    }
}
