//
//  LoginViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/10/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.makeViewCorner()
        signUpButton.makeViewCorner()
    }
}
