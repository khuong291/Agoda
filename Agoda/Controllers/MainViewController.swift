//
//  MainViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/8/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var darkBlurView: UIView!
    @IBOutlet var menuButton: UIButton!

    var menuShowed = false

    var menuVC: MenuViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add MenuViewController
        addMenuViewController()

        // Add searchVC
        let searchVC = storyboard?.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
        addSubViewController(searchVC, index: 0)
    }

    // MARK: Add MenuViewController

    private func addMenuViewController() {
        menuVC = storyboard!.instantiateViewControllerWithIdentifier("MenuViewController") as? MenuViewController
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
}
