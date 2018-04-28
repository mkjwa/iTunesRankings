//
//  Description.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import Foundation
import ObjectMapper

class Description: Mappable {
    var artworkUrl512:String = ""
    var artworkUrl100:String = ""
    var artworkUrl60:String = ""
    var screenshotUrls:[String] = []
    var artistViewUrl:String = ""
    var appletvScreenshotUrls:[String] = []
    var ipadScreenshotUrls:[String] = []
    var supportedDevices:[String] = []
    var kind:String = ""
    var isGameCenterEnabled:Bool = false
    var advisories:[String] = []
    var averageUserRatingForCurrentVersion:Int = 0
    var trackCensoredName:String = ""
    var languageCodesISO2A:[String] = []
    var fileSizeBytes:Int = 0
    var sellerUrl:String = ""
    var contentAdvisoryRating:String = ""
    var userRatingCountForCurrentVersion:Int = 0
    var trackViewUrl:String = ""
    var trackContentRating:String = ""
    var releaseDate:String = ""
    var trackId:Int = 0
    var trackName:String = ""
    var genreIds:[String] = []
    var formattedPrice:String = ""
    var currency:String = ""
    var wrapperType:String = ""
    var version:String = ""
    var artistId:Int = 0
    var artistName:String = ""
    var genres:[String] = []
    var price:Int = 0
    var description:String = ""
    var bundleId:String = ""
    var releaseNotes:String = ""
    var sellerName:String = ""
    var primaryGenreName:String = ""
    var minimumOsVersion:String = ""
    var currentVersionReleaseDate:String = ""
    var primaryGenreId:Int = 0
    var isVppDeviceBasedLicensingEnabled:Bool = false
    var averageUserRating:Float = 0
    var userRatingCount:Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        artworkUrl512 <- map["artworkUrl512"]
        artworkUrl100 <- map["artworkUrl100"]
        artworkUrl60 <- map["artworkUrl60"]
        screenshotUrls <- map["screenshotUrls"]
        artistViewUrl <- map["artistViewUrl"]
        appletvScreenshotUrls <- map["appletvScreenshotUrls"]
        ipadScreenshotUrls <- map["ipadScreenshotUrls"]
        supportedDevices <- map["supportedDevices"]
        kind <- map["kind"]
        isGameCenterEnabled <- map["isGameCenterEnabled"]
        advisories <- map["advisories"]
        averageUserRatingForCurrentVersion <- map["averageUserRatingForCurrentVersion"]
        trackCensoredName <- map["trackCensoredName"]
        languageCodesISO2A <- map["languageCodesISO2A"]
        fileSizeBytes <- map["fileSizeBytes"]
        sellerUrl <- map["sellerUrl"]
        contentAdvisoryRating <- map["contentAdvisoryRating"]
        userRatingCountForCurrentVersion <- map["userRatingCountForCurrentVersion"]
        trackViewUrl <- map["trackViewUrl"]
        trackContentRating <- map["trackContentRating"]
        releaseDate <- map["releaseDate"]
        trackId <- map["trackId"]
        trackName <- map["trackName"]
        genreIds <- map["genreIds"]
        formattedPrice <- map["formattedPrice"]  
        currency <- map["currency"]
        wrapperType <- map["wrapperType"]
        version <- map["version"]
        artistId <- map["artistId"]
        artistName <- map["artistName"]
        genres <- map["genres"]
        price <- map["price"]
        description <- map["description"]
        bundleId <- map["bundleId"]
        releaseNotes <- map["releaseNotes"]
        sellerName <- map["sellerName"]
        primaryGenreName <- map["primaryGenreName"]
        minimumOsVersion <- map["minimumOsVersion"]
        currentVersionReleaseDate <- map["currentVersionReleaseDate"]
        primaryGenreId <- map["primaryGenreId"]
        isVppDeviceBasedLicensingEnabled <- map["isVppDeviceBasedLicensingEnabled"]
        averageUserRating <- map["averageUserRating"]
        userRatingCount <- map["userRatingCount"]
    }
}
