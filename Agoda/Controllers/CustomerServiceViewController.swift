//
//  CustomerServiceViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/10/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class CustomerServiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var countries: [Country]!

    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }

    // MARK: Init DataSource

    private func initData() {
        let vietnam = Country(flagImage: UIImage(named: "vietnam")!, name: "Vietnam", phone: "+84 8 4458 2393")
        let us = Country(flagImage: UIImage(named: "us")!, name: "International", phone: "+44 20 3027 7900")
        let singapore = Country(flagImage: UIImage(named: "singapo")!, name: "Singapore", phone: "+65 6329 7537")
        countries = [vietnam, us, singapore]
    }

    // MARK: UITableViewDataSource and UITableViewDelegate

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 20
        }
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Suggested Country"
        } else if section == 1 {
            return "24/7 Live Agent"
        } else {
            return "By Country"
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomerServiceTableViewCell", forIndexPath: indexPath) as! CustomerServiceTableViewCell
        if indexPath.section == 0 {
            let country = countries[0]
            cell.countryNameLabel.text = country.name
            cell.flagImageView.image = country.flagImage
            cell.phoneNumberLabel.text = country.phone
        } else if indexPath.section == 1 {
            let country = countries[1]
            cell.countryNameLabel.text = country.name
            cell.flagImageView.image = country.flagImage
            cell.phoneNumberLabel.text = country.phone
        } else if indexPath.section == 2 {
            let country = countries[2]
            cell.countryNameLabel.text = country.name
            cell.flagImageView.image = country.flagImage
            cell.phoneNumberLabel.text = country.phone
        }
        return cell
    }
}
