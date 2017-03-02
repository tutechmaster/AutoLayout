//
//  CenterHVBaseLine.swift
//  DemoAdaptiveLayout
//
//  Created by Tuuu on 3/2/17.
//  Copyright © 2017 Techmaster Vietnam. All rights reserved.
//

import UIKit

class CenterHVBaseLine: UIViewController {

    @IBOutlet weak var baseLineConstraint: NSLayoutConstraint!
    @IBOutlet weak var xConstraint: NSLayoutConstraint!
    @IBOutlet weak var yConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var lbl_BaseLine: UILabel!
    var isCemterY = false
    var isCenterX = false
    var isBaseLine = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func changeHorizontal(_ sender: Any) {
        isCenterX = !isCenterX
        self.view.removeConstraint(xConstraint)
        if(isCenterX == true)
        {
            xConstraint = NSLayoutConstraint(item: self.secondView, attribute: .centerX, relatedBy: .equal, toItem: self.firstView, attribute: .centerX, multiplier: 1.0, constant: 0)
        }
        else
        {
            xConstraint = NSLayoutConstraint(item: self.secondView, attribute: .leading, relatedBy: .equal, toItem: self.firstView, attribute: .leading, multiplier: 1.0, constant: 0)
        }
        self.view.addConstraint(xConstraint)
    }
    @IBAction func changeVertical(_ sender: Any) {
        isCemterY = !isCemterY
        self.view.removeConstraint(yConstraint)
        if(isCemterY == true)
        {
            yConstraint = NSLayoutConstraint(item: self.secondView, attribute: .centerY, relatedBy: .equal, toItem: self.firstView, attribute: .centerY, multiplier: 1.0, constant: 0)
        }
        else
        {
            yConstraint = NSLayoutConstraint(item: self.secondView, attribute: .top, relatedBy: .equal, toItem: self.firstView, attribute: .bottom, multiplier: 1.0, constant: 0)
        }
        self.view.addConstraint(yConstraint)
    }
    @IBAction func changeBaseLine(_ sender: Any) {
        isBaseLine = !isBaseLine
        self.view.removeConstraint(baseLineConstraint)
        if(isBaseLine == true)
        {
            baseLineConstraint = NSLayoutConstraint(item: self.lbl_BaseLine, attribute: .firstBaseline, relatedBy: .equal, toItem: self.secondView, attribute: .top, multiplier: 1.0, constant: 0)
        }
        else
        {
            baseLineConstraint = NSLayoutConstraint(item: self.lbl_BaseLine, attribute: .lastBaseline, relatedBy: .equal, toItem: self.secondView, attribute: .top, multiplier: 1.0, constant: 0)
        }
        self.view.addConstraint(baseLineConstraint)
    }
    
}
