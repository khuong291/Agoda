//
//  CustomerServiceTableViewCell.swift
//  Agoda
//
//  Created by Khuong Pham on 6/10/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class CustomerServiceTableViewCell: UITableViewCell {
    
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var flagImageView: UIImageView!
    var country: Country!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureCell()
    }

    func configureCell() {
        countryNameLabel.text = country.name
        flagImageView.image = country.flagImage
        phoneNumberLabel.text = country.phone
    }

    @IBAction func callButtonTapped(sender: AnyObject) {

    }
}
