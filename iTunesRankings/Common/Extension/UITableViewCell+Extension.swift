//
//  UITableViewCell+Extension.swift
//  iTunesRankings
//
//  Created by RetinaFish on 27/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

fileprivate extension UIResponder {
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}

extension UITableViewCell {
    var indexPath: IndexPath? {
        guard let superView = next(UITableView.self) else {
            print("[Error] Cannot Find IndexPath in TableView")
            return nil
        }
        
        return superView.indexPath(for: self)
    }
}
