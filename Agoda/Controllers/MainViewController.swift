//
//  MainViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/8/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MenuViewControllerDelegate {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var rightLabel: UILabel!
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var lineView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var darkBlurView: UIView!
    @IBOutlet var menuButton: UIButton!

    var menuShowed = false

    var menuVC: MenuViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        topView.hidden = true
        stackView.hidden = true
        lineView.hidden = true
        leftLabel.hidden = true
        rightLabel.hidden = true

        // Add MenuViewController
        addMenuViewController()

        // Add searchVC
        let searchVC = storyboard?.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
        addSubViewController(searchVC, index: 0)
    }

    // MARK: Add MenuViewController

    private func addMenuViewController() {
        menuVC = storyboard!.instantiateViewControllerWithIdentifier("MenuViewController") as? MenuViewController
        menuVC.delegate = self
        addSubViewController(menuVC)
        menuVC.view.frame.origin.x -= view.frame.width
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.hideMenuViewController))
        menuVC.emptyRightView.addGestureRecognizer(tapGesture)
        menuVC.view.layoutIfNeeded()
    }

    // Hide MenuViewController
    func hideMenuViewController() {
        if menuShowed {
            UIView.animateWithDuration(0.3, delay: 0.0, options: [.CurveEaseInOut], animations: {
                self.menuVC.view.frame.origin.x -= self.view.frame.width
                self.menuVC.view.layoutIfNeeded()
                self.darkBlurView.alpha = 0.0
            }) { _ in
                self.menuShowed = false
            }
        }
    }

    // Menu Button Action
    @IBAction func menuButtonTapped(sender: UIButton) {
        if menuShowed == false {
            UIView.animateWithDuration(0.3, delay: 0.0, options: [.CurveEaseInOut], animations: {
                self.menuVC.view.frame.origin.x += self.view.frame.width
                self.menuVC.view.layoutIfNeeded()
                self.darkBlurView.alpha = 0.5
            }) { _ in
                self.menuShowed = true
            }
        }
    }

    // MARK: MenuViewController Delegate
    func didSelectedItem(title: String) {
        switch title {
        case "Search":
            self.hideMenuViewController()
            dispatch_async(dispatch_get_main_queue(), { 
                self.titleLabel.hidden = false
                self.topView.hidden = true
                self.stackView.hidden = true
                self.lineView.hidden = true
                self.leftLabel.hidden = true
                self.rightLabel.hidden = true

                self.menuButton.setImage(UIImage(named: "menu"), forState: .Normal)
            })
        case "Favorites / History":
            self.hideMenuViewController()
            dispatch_async(dispatch_get_main_queue(), {

                self.topView.hidden = false
                self.stackView.hidden = false
                self.lineView.hidden = false
                self.leftLabel.hidden = false
                self.rightLabel.hidden = false
                self.titleLabel.hidden = true

                self.menuButton.setImage(UIImage(named: "blackmenu"), forState: .Normal)
                self.leftLabel.text = "Favorites"
                self.rightLabel.text = "History"
            })
        case "Language", "Price Display", "Unit", "Bug Reporter": break
        default:
            self.hideMenuViewController()
            dispatch_async(dispatch_get_main_queue()) {
                self.topView.hidden = false
                self.stackView.hidden = false
                self.lineView.hidden = true
                self.leftLabel.hidden = true
                self.rightLabel.hidden = true
                self.titleLabel.hidden = false

                self.titleLabel.text = title
                self.menuButton.setImage(UIImage(named: "blackmenu"), forState: .Normal)
            }
        }

    }
}
