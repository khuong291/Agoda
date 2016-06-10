//
//  ResultViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/9/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var introView: UIView!
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

        introView.makeViewCorner()
        introButton.makeViewCorner()

        let sortTapGesture = UITapGestureRecognizer(target: self, action: #selector(ResultViewController.openSortAndFilterViewController))
        sortView.addGestureRecognizer(sortTapGesture)
    }

    private func initTabViews() {
        sortView.tabImageView.image = UIImage(named: "sort")
        sortView.tabNameLabel.text = "Sort & Filter"
        showMapView.tabImageView.image = UIImage(named: "map")
        showMapView.tabNameLabel.text = "Map"
        currencyView.tabImageView.image = UIImage(named: "currency")
        currencyView.tabNameLabel.text = "VND"
    }

    // MARK: OpenSortAndFilterViewController

    func openSortAndFilterViewController() {
        let sortAndFilterVC = storyboard?.instantiateViewControllerWithIdentifier("SortAndFilterViewController") as! SortAndFilterViewController
        presentViewController(sortAndFilterVC, animated: true, completion: nil)
    }

    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultTableViewCell", forIndexPath: indexPath) as! ResultTableViewCell
        return cell
    }

    // MARK: UITableViewDelegate

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
}
