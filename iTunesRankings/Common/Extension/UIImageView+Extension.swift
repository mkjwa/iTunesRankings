//
//  UIImageViw+Extension.swift
//  iTunesRankings
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit
@IBDesignable

extension UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIImageView {
    func setImgUrl(_ urlString:String) {
    
        CacheManager.shared.getImageInCache(url:urlString) { (cachedImage) in
            if cachedImage != nil {
                self.image = cachedImage
            } else {
                self.download(urlString) { (raw, filename, finished) in
                    if finished {
                        let image = UIImage(data: raw!)
                        
                        if let _ = filename {
                            CacheManager.shared.updateCache(filename!, data: raw)
                        }
                        
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
    
    private func download(_ urlString:String, finishHandler: @escaping (_ raw:Data?, _ filename:String?, _ finished:Bool) -> Void) {
        
        guard let url = URL(string: urlString) else {
            finishHandler(nil, nil, false)
            return
        }
        
        let filename = urlString // 전체 패스를 Cache 이름으로 사용
        
        DispatchQueue.global().async {
            if let data = NSData(contentsOf: url as URL) {
                finishHandler(data as Data, filename, true)
            }
        }
    }
}
