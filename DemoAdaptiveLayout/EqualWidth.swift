//
//  EqualWidth.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage/VisualFormatLanguage.html
//http://angelovillegas.com/2014/01/31/ios-nslayoutconstraint/
import UIKit

class EqualWidth: UIViewController {
    
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
        
        let views: [String:UIView] = ["view": self.view, "blueRect": blueRect]
        //Vertical space: cách top 40 point, cao 100 point
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect(100)]", options: [], metrics: nil, views: views))
        //Ngang 100 point
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[blueRect(100)]", options: [], metrics: nil, views: views))
        //CenterX blue
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        
        let blueOrange = ["blueRect": blueRect, "orangeRect": orangeRect]
        //CenterX orange
        self.view.addConstraint(NSLayoutConstraint(item: orangeRect, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        //make blue and orage same width
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[orangeRect(==blueRect)]", options: [], metrics: nil, views: blueOrange))
        //make blue and orage same height
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[orangeRect(==blueRect)]", options: [], metrics: nil, views: blueOrange))
        //Vertical space between blue and orange is 10. Try [blueRect][orangeRect]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[blueRect]-10-[orangeRect]", options: [], metrics: nil, views: blueOrange))
    }
    
}
