//
//  TabItemView.swift
//  Agoda
//
//  Created by Khuong Pham on 6/9/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class TabItemView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var tabImageView: UIImageView!
    @IBOutlet var tabNameLabel: UILabel!

    required override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "TabItemView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
