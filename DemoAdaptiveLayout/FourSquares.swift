//
//  FourSquares.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class FourSquares: UIViewController {
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
        
        let greenRect = UIView()
        greenRect.backgroundColor = UIColor.green
        self.view.addSubview(greenRect)
        greenRect.translatesAutoresizingMaskIntoConstraints = false
        
        
        let grayRect = UIView()
        grayRect.backgroundColor = UIColor.gray
        self.view.addSubview(grayRect)
        grayRect.translatesAutoresizingMaskIntoConstraints = false
        
        //BlueRect
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20.0-[blueRect(100)]", options: [], metrics: nil, views: ["view": self.view, "blueRect": blueRect]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20.0-[blueRect(100)]", options: [], metrics: nil, views: ["view": self.view, "blueRect": blueRect]))
        
        //OrangeRect
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20.0-[orangeRect(100)]", options: [], metrics: nil, views: ["view": self.view, "orangeRect": orangeRect]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[orangeRect(100)]-20.0-|", options: [], metrics: nil, views: ["view": self.view, "orangeRect": orangeRect]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[greenRect(100)]-20.0-|", options: [], metrics: nil, views: ["view": self.view, "greenRect": greenRect]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[greenRect(100)]-20.0-|", options: [], metrics: nil, views: ["view": self.view, "greenRect": greenRect]))
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[grayRect(100)]-20.0-|", options: [], metrics: nil, views: ["view": self.view, "grayRect": grayRect]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20.0-[grayRect(100)]", options: [], metrics: nil, views: ["view": self.view, "grayRect": grayRect]))
        
    }
    override func updateViewConstraints(){
        super.updateViewConstraints()
        let size = self.view.bounds.size
        
        print("updateViewConstraints. width = \(size.width), height = \(size.height)")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }

}
