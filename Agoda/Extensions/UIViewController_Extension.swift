//
//  UIViewController_Extension.swift
//  Agoda
//
//  Created by Khuong Pham on 6/7/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

extension UIViewController {
    func addSubViewController(viewCtrl: UIViewController, index: Int? = nil) {
        viewCtrl.willMoveToParentViewController(self)
        if index == nil {
            self.view.addSubview(viewCtrl.view)
        } else {
            self.view.insertSubview(viewCtrl.view, atIndex: index!)
        }
        self.addChildViewController(viewCtrl)
        viewCtrl.didMoveToParentViewController(self)
    }

    func removeFromSuperViewController() {
        self.willMoveToParentViewController(nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        self.didMoveToParentViewController(nil)
    }
}
