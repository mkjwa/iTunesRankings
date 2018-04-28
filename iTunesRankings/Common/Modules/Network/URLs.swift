//
//  Urls.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation

let base_url = "https://itunes.apple.com/"

struct APIs {
    static func category(genre:Int, limit:Int) -> String {
        return "\(base_url)/kr/rss/topfreeapplications/limit=\(limit)/genre=\(genre)/json"
    }
    static func lookup(id:String) -> String {
        return "\(base_url)/lookup?id=\(id)&country=kr"
    }
}
