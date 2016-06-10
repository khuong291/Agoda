//
//  Country.swift
//  Agoda
//
//  Created by Khuong Pham on 6/10/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class Country {
    var flagImage: UIImage!
    var name: String!
    var phone: String!

    init(flagImage: UIImage, name: String, phone: String) {
        self.flagImage = flagImage
        self.name = name
        self.phone = phone
    }
}
