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
    @IBOutlet var checkInView: CheckDateView!
    @IBOutlet var checkOutView: CheckDateView!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = storyboard?.instantiateViewControllerWithIdentifier("HomePageViewController") as! HomePageViewController
        addSubViewController(homeVC, index: 0)

        searchView.makeViewCorner()
        searchBar.makeViewCorner()
        checkDateView.makeViewCorner()
        quantityView.makeViewCorner()
        darkView.makeViewCorner()
        searchButton.makeViewCorner()

        // Create Data For CheckDateView
        createDataForCheckOutView()
        createDataForCheckInView()

    }

    // MARK: Create Data For CheckDateView

    private func createDataForCheckInView() {
        checkInView.checkInLabel.text = "Check-in"
        checkInView.dateLabel.text = "06"
        checkInView.dayLabel.text = "Mon"
        checkInView.monthLabel.text = "Jun"
    }

    private func createDataForCheckOutView() {
        checkOutView.checkInLabel.text = "Check-out"
        checkOutView.dateLabel.text = "07"
        checkOutView.dayLabel.text = "tue"
        checkOutView.monthLabel.text = "Jun"
    }

}