//
//  ResultViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/9/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var currencyView: TabItemView!
    @IBOutlet var showMapView: TabItemView!
    @IBOutlet var sortView: TabItemView!
    @IBOutlet var numberOfGuestLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var introButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        initTabViews()

        introButton.layer.cornerRadius = 5
        introButton.clipsToBounds = true
    }

    private func initTabViews() {
        sortView.tabImageView.image = UIImage(named: "sort")
        sortView.tabNameLabel.text = "Sort & Filter"
        showMapView.tabImageView.image = UIImage(named: "map")
        showMapView.tabNameLabel.text = "Map"
        currencyView.tabImageView.image = UIImage(named: "currency")
        currencyView.tabNameLabel.text = "VND"
    }

    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
