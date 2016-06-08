//
//  MenuItem.swift
//  Agoda
//
//  Created by Khuong Pham on 6/8/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MenuItem {
    var itemImageName: String!
    var itemImage: UIImage! {
        return UIImage(named: itemImageName)
    }
    var itemName: String!
    var itemRightView: UIView?

    init(itemImageName: String, itemName: String, itemRightView: UIView? = nil) {
        self.itemImageName = itemImageName
        self.itemName = itemName
        if itemRightView != nil {
            self.itemRightView = itemRightView
        }
    }
}
