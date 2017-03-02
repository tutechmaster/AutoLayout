//
//  LeadingTrailing.swift
//  DemoAdaptiveLayout
//
//  Created by Tuuu on 3/2/17.
//  Copyright © 2017 Techmaster Vietnam. All rights reserved.
//

import UIKit

class TopLeftBottomRight: UIViewController {
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    var isLeading = true
    var isTop = true
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func changeTopBottom(_ sender: Any) {
        isTop = !isTop
        self.view.removeConstraint(topConstraint)
        if(isTop == true)
        {
            topConstraint = NSLayoutConstraint(item: self.secondView, attribute: .top, relatedBy: .equal, toItem: self.firstView, attribute: .top, multiplier: 1.0, constant: 0)
        }
        else
        {
            topConstraint = NSLayoutConstraint(item: self.secondView, attribute: .top, relatedBy: .equal, toItem: self.firstView, attribute: .bottom, multiplier: 1.0, constant: 0)
        }
        self.view.addConstraint(topConstraint)
    }
    @IBAction func change(_ sender: Any) {
        isLeading = !isLeading
        self.view.removeConstraint(leadingConstraint)
        if(isLeading == true)
        {
            leadingConstraint = NSLayoutConstraint(item: self.secondView, attribute: .leading, relatedBy: .equal, toItem: self.firstView, attribute: .leading, multiplier: 1.0, constant: 0)
        }
        else
        {
            leadingConstraint = NSLayoutConstraint(item: self.secondView, attribute: .leading, relatedBy: .equal, toItem: self.firstView, attribute: .trailing, multiplier: 1.0, constant: 0)
        }
        self.view.addConstraint(leadingConstraint)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
