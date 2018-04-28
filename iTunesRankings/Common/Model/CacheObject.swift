//
//  CacheObject.swift
//  project_ios_mkjwa
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

class CacheObject: NSObject {
    var key:String = ""
    var image:UIImage?
    
    required override init() {
        super.init()
    }
    
    convenience init(key:String, image:UIImage) {
        self.init()
        
        self.key = key
        self.image = image
    }
}
