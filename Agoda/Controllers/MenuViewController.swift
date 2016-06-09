//
//  MenuViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/7/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: NSObjectProtocol {
    func didSelectedItem(title: String)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var coverView: UIView!
    @IBOutlet var emptyRightView: UIView!

    let sections = ["My Account", "Settings", "Information"]
    var menuItems: [[MenuItem]]!

    weak var delegate: MenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        createMenuItemsData()
    }

    // MARK: Create MenuItems Data

    private func createMenuItemsData() {
        menuItems = [[MenuItem]]()
        menuItems.append([MenuItem]())
        menuItems.append([MenuItem]())
        menuItems.append([MenuItem]())
        let search = MenuItem(itemImageName: "search", itemName: "Search")
        let favorite = MenuItem(itemImageName: "favorite", itemName: "Favorites / History")
        let login = MenuItem(itemImageName: "login", itemName: "Login")
        let point = MenuItem(itemImageName: "point", itemName: "PointsMAX")
        let promotion = MenuItem(itemImageName: "promotion", itemName: "Promotions")
        let language = MenuItem(itemImageName: "language", itemName: "Language")
        let price = MenuItem(itemImageName: "price", itemName: "Price Display")
        let unit = MenuItem(itemImageName: "unit", itemName: "Unit")
        let bug = MenuItem(itemImageName: "bug", itemName: "Bug Reporter")
        let customer = MenuItem(itemImageName: "customer", itemName: "Customer Service")
        let about = MenuItem(itemImageName: "about", itemName: "About Us")
        menuItems[0].appendContentsOf([search, favorite, login, point, promotion])
        menuItems[1].appendContentsOf([language, price, unit, bug])
        menuItems[2].appendContentsOf([customer, about])
    }

    // MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemTableViewCell", forIndexPath: indexPath) as! MenuItemTableViewCell
        let menuItem = menuItems[indexPath.section][indexPath.row]
        cell.itemLabel.text = menuItem.itemName
        cell.itemImageView.image = menuItem.itemImage
        if menuItem.itemName == "Price Display" {
            let currencyLabel = UILabel()
            currencyLabel.text = "USD"
            currencyLabel.sizeToFit()
            currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        return cell
    }

    // MARK: UITableViewDelegate 

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let menuItem = menuItems[indexPath.section][indexPath.row]
        let title = menuItem.itemName
        delegate?.didSelectedItem(title)
    }
}
