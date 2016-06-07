//
//  MainViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/7/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var agodaView: Agoda!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = storyboard?.instantiateViewControllerWithIdentifier("HomePageViewController") as! HomePageViewController
        addSubViewController(homeVC, index: 0)
    }
}