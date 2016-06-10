//
//  AgodaView.swift
//  Agoda
//
//  Created by Khuong Pham on 6/7/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class AgodaView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var purpleView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var redView: UIView!

    required override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "AgodaView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)

        blueView.makeViewCircle()
        purpleView.makeViewCircle()
        greenView.makeViewCircle()
        redView.makeViewCircle()
        yellowView.makeViewCircle()

        contentView.frame = bounds
        addSubview(contentView)
    }
}
