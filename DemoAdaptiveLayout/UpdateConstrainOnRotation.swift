//
//  UpdateConstrainOnRotation.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class UpdateConstrainOnRotation: UIViewController {
    var blueRect: UILabel?
    var orangeRect: UILabel?
    //portrait
    var c1, c2, c3: [NSLayoutConstraint]?
    var co1, co2: NSLayoutConstraint?
    
    //landscape
    var c_1, c_2, c_3: [NSLayoutConstraint]?
    var co_1, co_2: NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        
        blueRect = UILabel()
        blueRect!.text = "A"
        blueRect!.textAlignment = NSTextAlignment.center
        blueRect!.backgroundColor = UIColor.blue
        self.view.addSubview(blueRect!)
        blueRect!.translatesAutoresizingMaskIntoConstraints = false
        
        
        orangeRect = UILabel()
        orangeRect!.text = "B"
        orangeRect!.textAlignment = NSTextAlignment.center
        orangeRect!.backgroundColor = UIColor.orange
        self.view.addSubview(orangeRect!)
        orangeRect!.translatesAutoresizingMaskIntoConstraints = false
        
        portraitConstraint()
        landscapeConstraint()
        toggleConstraint(true)
    }
    
    func portraitConstraint() {
        let views: [String:UIView] = ["view": self.view, "blueRect": blueRect!, "orangeRect": orangeRect!]
        //Vertical space:
        c1 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect]-10.0-[orangeRect]-40.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(c1!)
        
        c2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-40.0-[blueRect]-40.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(c2!)
        
        c3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-40.0-[orangeRect]-40.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(c3!)
        
        co1 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: blueRect!, attribute: NSLayoutAttribute.height, multiplier: 2, constant: 0)
        
        self.view.addConstraint(co1!)
        
        co2 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: blueRect!, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)
        self.view.addConstraint(co2!)
    }
    
    func toggleConstraint(_ portrait: Bool) {
        if portrait {
            //Always deactivate constraint first
            NSLayoutConstraint.deactivate(c_1!)
            NSLayoutConstraint.deactivate(c_2!)
            NSLayoutConstraint.deactivate(c_3!)
            
            co_1!.isActive = false
            co_2!.isActive = false

            //Then activate later
            NSLayoutConstraint.activate(c1!)
            NSLayoutConstraint.activate(c2!)
            NSLayoutConstraint.activate(c3!)
            
            co1!.isActive = true
            co2!.isActive = true
            
           
        } else {
            NSLayoutConstraint.deactivate(c1!)
            NSLayoutConstraint.deactivate(c2!)
            NSLayoutConstraint.deactivate(c3!)
        
            co1!.isActive = false
            co2!.isActive = false
            
            
            NSLayoutConstraint.activate(c_1!)
            NSLayoutConstraint.activate(c_2!)
            NSLayoutConstraint.activate(c_3!)
            
            co_1!.isActive = true
            co_2!.isActive = true
        }
    }
    
    func landscapeConstraint() {
        let views: [String:UIView] = ["view": self.view, "blueRect": blueRect!, "orangeRect": orangeRect!]
        //Horizonal space:
        c_1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-40.0-[blueRect]-10.0-[orangeRect]-40.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(c_1!)
        
        c_2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect]-40.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(c_2!)
        
        c_3 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[orangeRect]-40.0-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(c_3!)
        
        
        co_1 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: blueRect!, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)
        
        self.view.addConstraint(co_1!)
        
        co_2 = NSLayoutConstraint(item: orangeRect!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: blueRect!, attribute: NSLayoutAttribute.width, multiplier: 2, constant: 0)
        self.view.addConstraint(co_2!)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let size = self.view.bounds.size
        if size.width < size.height { //portrait
           toggleConstraint(true)            
        } else {
           toggleConstraint(false)
        }
        
    }

   
}
