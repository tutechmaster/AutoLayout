//
//  DemoIntrinsicContentSize.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoIntrinsicContentSize: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crazy fox jumps over the fence"
        label.backgroundColor = UIColor.gray
        let sizeLabel = label.intrinsicContentSize
        print("w = \(sizeLabel.width), h = \(sizeLabel.height)")
        
        self.view.addSubview(label)
        
        let views: [String:UIView] = ["view": self.view, "label": label]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10.0-[label]", options: [], metrics: nil, views: views))

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10.0-[label]", options: [], metrics: nil, views: views))
    }


}
