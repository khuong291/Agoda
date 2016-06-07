//
//  UIView_Extension.swift
//  Agoda
//
//  Created by Khuong Pham on 6/7/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

extension UIView {
    func makeViewCircle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

    func makeViewCorner() {
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
}
