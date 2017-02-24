//
//  ModifyConstraint.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ModifyConstraint: UIViewController {
    var cs1, cs2: [NSLayoutConstraint]?
    
    var cs_1, cs_2: [NSLayoutConstraint]?
    
    var isTopLeft: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crazy fox jumps over"
        label.backgroundColor = UIColor.gray
        let sizeLabel = label.intrinsicContentSize
        print("w = \(sizeLabel.width), h = \(sizeLabel.height)")
        
        self.view.addSubview(label)
        
        let views: [String:UIView] = ["view": self.view, "label": label]
        
        cs1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10.0-[label]", options: [], metrics: nil, views: views)
        self.view.addConstraints(cs1!)
        
        cs2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10.0-[label]", options: [], metrics: nil, views: views)
        self.view.addConstraints(cs2!)
        
        
        cs_1 = NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-10.0-|", options: [], metrics: nil, views: views)
       
        self.view.addConstraints(cs_1!)
        
        cs_2 = NSLayoutConstraint.constraints(withVisualFormat: "H:[label]-10.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(cs_2!)
        NSLayoutConstraint.deactivate(cs_1!)
        NSLayoutConstraint.deactivate(cs_2!)
        
        //Button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        button.setTitle("Have fun", for: UIControlState())
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ModifyConstraint.flipLabel), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
    }
    
    func flipLabel() {
        isTopLeft = !isTopLeft
        if isTopLeft {
            NSLayoutConstraint.deactivate(cs_1!)
            NSLayoutConstraint.deactivate(cs_2!)
            NSLayoutConstraint.activate(cs1!)
            NSLayoutConstraint.activate(cs2!)
        } else {
            NSLayoutConstraint.deactivate(cs1!)
            NSLayoutConstraint.deactivate(cs2!)
            NSLayoutConstraint.activate(cs_1!)
            NSLayoutConstraint.activate(cs_2!)
            
        }
    }
}
