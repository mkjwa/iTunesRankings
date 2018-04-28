//
//  CacheManager.swift
//  project_ios_mkjwa
//
//  Created by RetinaFish on 26/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

struct Storage {
    static let cachePath =  "Cache"
}

class CacheManager: NSObject {
    private let fileManager = FileManager.default
    private let resourcePath = Bundle.main.resourcePath!
    
    private var memoryCacheList:[CacheObject] = []
    
    // MARK:- Open Methods
    
    open func getImageInCache(url:String, finishHandler handler:@escaping (_ imge:UIImage?) -> Void) {
        let filename = url // Cache 이름을  url full path로 사용
        
        if let image = getCachedImage(filename) {
           handler(image)
        } else {
           handler(nil)
        }
    }
    
    open func updateCache(_ filename:String, data:Data?) {
        if let raw = data  {
            if self.getImageFile(filename) == nil {
                self.storeImageIntoFile(filename, data: raw)
            }
            
            if let image = UIImage(data:raw) {
                self.updateMemoryCache(filename: filename, image: image)
            }
        }
    }
    
    // MARK:- Local Methods

    // 메모리 캐시 를 검색 하고, 파일 캐시를 검색 한다.
    private func getCachedImage(_ filename:String) -> UIImage? {
        if let result = memoryCacheList.filter({ (object) -> Bool in
            object.key == filename}).first {
            print("[Cache](Mem) loaded : \(filename)")
            return result.image
        } else {
            guard let image = self.getImageFile(filename) else {
                return nil
            }
            
            print("[Cache](Disk) loaded : \(filename)")
             // 파일은 있지만 메모리에 올라와 있지 않으면, 메모리 캐시에 업데이트 해준다.
            self.updateMemoryCache(filename: filename, image: image)
            return image
        }
    }
    
    // MARK:- Memory
    
    open func updateMemoryCache(filename:String, image:UIImage) {
        if memoryCacheList.filter({ (object) -> Bool in
            object.key == filename
        }).first == nil {
            let cacheObject = CacheObject(key: filename, image: image)
            memoryCacheList.append(cacheObject)
        }
    }
    
    // MARK:- File
    
    private func storeImageIntoFile(_ filename:String, data:Data) {

        if let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documents.appendingPathComponent("\(Storage.cachePath)")
            
            if !FileManager.default.fileExists(atPath: filePath.path) {
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    NSLog("Couldn't create document directory")
                }
            }

            let newFilename = filename.replacingOccurrences(of: "/", with: "_", options: .literal, range: nil)
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("\(Storage.cachePath)/\(newFilename)")
        
            do {
                try data.write(to: fileURL)
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    private func getImageFile(_ filename:String) -> UIImage? {
        let newFilename = filename.replacingOccurrences(of: "/", with: "_", options: .literal, range: nil)
        let path = "\(Storage.cachePath)/\(newFilename)"
        
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let url = documentsURL.appendingPathComponent(path)
        
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data:data)
        } catch {
            print("error:\(error)")
        }
        
        return nil
    }
    
    private func getBasicFilePath(filename:String) -> URL {
        var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        documentsURL.appendPathComponent("\(Storage.cachePath)/\(filename)")
        
        return documentsURL
    }

    // MARK:- Initialization
    
    static var shared:CacheManager {
        if CacheManager.sharedManager == nil {
            CacheManager.sharedManager = CacheManager()
        }
        
        return CacheManager.sharedManager
    }
    
    private static var sharedManager:CacheManager!
}
