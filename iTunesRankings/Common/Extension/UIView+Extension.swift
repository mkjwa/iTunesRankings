//
//  UIView+Extension.swift
//  iTunesRankings
//
//  Created by RetinaFish on 28/04/2018.
//  Copyright © 2018 mkjwa. All rights reserved.
//

import UIKit

extension UIView {
    // Dock Scene 등 을 다른 뷰에 addSubview 할 때 부모뷰에 Margin = 0 으로 추가 하는 용도
    open func setResizeFitInSuperview() {
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        }
    }
}
