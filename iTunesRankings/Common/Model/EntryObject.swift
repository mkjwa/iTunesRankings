//
//  EntryObject.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation
import ObjectMapper

class Entry:  Mappable {
    var name:String = ""
    var image:[Image] = []
    var summary:String = ""
    var price:Price?
    var contentType:ContentType?
    var rights:String = ""
    var title:String = ""
    var link:Link?
    var appId:Id?
    var artist:Artist?
    var category:Category?
    var releaseDate:ReleaseDate?
    // MARK:- Mappable
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        name <- map["im:name.label"]
        summary <- map["summary.label"]
        image <- map["im:image"]
        price <- map["im:price"]
        contentType <- map["im:contentType"]
        rights <- map["rights.label"]
        title <- map["title.label"]
        link <- map["link"]
        appId <- map["id"]
        artist <- map["im:artist"]
        category <- map["category"]
        releaseDate <- map["im:releaseDate"]
    }
}

class Image: Mappable {
    var label:String = ""
    var height:Int = 0

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        height <- map["attributes.height"]
    }
}

class Price: Mappable {
    var label:String = ""
    var amount:Float = 0
    var currency:String = ""

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        amount <- map["attributes.amount"]
        currency <- map["attributes.currency"]
    }
}

class ContentType: Mappable {
    var term:String = ""
    var label:String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        term <- map["attributes.term"]
        label <- map["attributes.label"]
    }
}

class Link: Mappable {
    var rel:String = ""
    var type:String = ""
    var href:String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        rel <- map["attributes.rel"]
        type <- map["attributes.type"]
        href <- map["attributeshref.href"]
    }
}

class Id: Mappable {
    var label:String = ""
    var id:String = ""
    var bundleId:String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        id <- map["attributes.im:id"]
        bundleId <- map["attributes.im:bundleId"]
    }
}

class Artist: Mappable {
    var label:String = ""
    var href:String = ""
 
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        href <- map["attributes.href"]
    }
}

class Category: Mappable {
    var id:String = ""
    var term:String = ""
    var scheme:String = ""
    var label:String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["attributes.im:id"]
        term <- map["attributes.term"]
        scheme <- map["attributes.scheme"]
        label <- map["attributes.label"]
    }
}

class ReleaseDate: Mappable {
    var dateTime:String = ""
    var date:String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        dateTime <- map["label"]
        date <- map["attributes.label"]
    }
}
