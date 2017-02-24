//
//  DemoOptions.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/15/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoOptions: UIViewController {
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        
        let blueRect = UIView()
        blueRect.backgroundColor = UIColor.blue
        self.view.addSubview(blueRect)
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        
        
        let orangeRect = UIView()
        orangeRect.backgroundColor = UIColor.orange
        self.view.addSubview(orangeRect)
        orangeRect.translatesAutoresizingMaskIntoConstraints = false
        
        
        let redRect = UIView()
        redRect.backgroundColor = UIColor.red
        self.view.addSubview(redRect)
        redRect.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String:UIView] = ["view": self.view, "blueRect": blueRect]
        //Vertical space: cách top 40 point, cao 100 point
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect(100)]", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[blueRect(100)]", options: [], metrics: nil, views: views))
       
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        
        
        //ORANGE
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: blueRect, attribute: NSLayoutAttribute.width, multiplier: 2.0, constant: 0))
        
        /* Thực hành thử thay đổi
            options: NSLayoutFormatOptions.AlignAllLeft
            options: NSLayoutFormatOptions.AlignAllLeading
        */

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[blueRect]-20-[orangeRect(50)]", options: NSLayoutFormatOptions.alignAllLeading, metrics: nil, views: ["blueRect": blueRect, "orangeRect": orangeRect]))
        
        //RED
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: redRect, attribute: NSLayoutAttribute.width, multiplier: 2.0, constant: 0))
        //options: NSLayoutFormatOptions.AlignAllTrailing
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[orangeRect]-20-[redRect(50)]", options: NSLayoutFormatOptions.alignAllTrailing, metrics: nil, views: ["orangeRect": orangeRect, "redRect": redRect]))
       
        
    }

}
