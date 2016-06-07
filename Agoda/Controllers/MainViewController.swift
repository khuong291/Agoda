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
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var checkDateView: UIView!
    @IBOutlet var quantityView: UIView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var darkView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = storyboard?.instantiateViewControllerWithIdentifier("HomePageViewController") as! HomePageViewController
        addSubViewController(homeVC, index: 0)

        searchView.makeViewCorner()
        searchBar.makeViewCorner()
        checkDateView.makeViewCorner()
        quantityView.makeViewCorner()
        darkView.makeViewCorner()
    }

}