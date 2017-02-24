//
//  DemoMetrics.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoMetrics: UIViewController {
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        let blueRect = UIView()
        blueRect.backgroundColor = UIColor.blue
        
        self.view.addSubview(blueRect)
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String:UIView] = ["view": self.view, "blueRect": blueRect]  //định nghĩa kiểu views rõ ràng là ok
        //Demo cách truyền metric vào constraint
        let metric = ["Vspace": 10, "Hspace": 80]
        //TODO: Tú em fix crash ở đây. Anh đã sửa được rồi !
        //http://stackoverflow.com/questions/39520534/autolayout-issue-xcode-8-swiftvalue-nsli-superitem
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-Vspace-[blueRect]-Vspace-|", options: [], metrics: metric, views: views))
        

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-Hspace-[blueRect]-Hspace-|", options: [], metrics: metric, views: views))
    }
}
