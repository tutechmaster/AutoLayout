//
//  LayoutConstraint.swift
//  DemoAdaptiveLayout
//
//  Created by Trinh Minh Cuong on 10/14/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class CenterX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        
        let blueRect = UIView()
        blueRect.backgroundColor = UIColor.blue
        self.view.addSubview(blueRect)
        //1. làm lệnh dưới để không app dụng Autoresizing mask
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        
        //http://stackoverflow.com/questions/12873372/centering-a-view-in-its-superview-using-visual-format-language
        //http://commandshift.co.uk/blog/2013/01/31/visual-format-language-for-autolayout/
        
        //2. Tạo một dictionary gồm các phần tử sẽ liên hệ với nhau qua các ràng buộc (constraint)
        let views: [String:UIView] = ["view": self.view, "blueRect": blueRect]
        
        //3. Khởi tạo đối tượng NSLayoutConstraint
        //VisualFormat là một dạng cú pháp đơn giản để mô tả ràng buộc theo AsciiArt. Nó chỉ có 2 loại
        //H: horizontal
        //V: vertical
        //- có space
        //[một đối tượng view(width hoặc height của đối tượng)]
        //| cạnh ngang hoặc dọc
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[blueRect(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: views))  //blueRect có chiều rộng là 100 point
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[blueRect(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: views))  //blueRect có chiều cao là 50 point
        
        //Dưới đây là hàm tạo ràng buộc giữa 2 thuộc tính của 2 UIView
        // ViewA.Thuộc tinhX = ViewB.Thuộc tínhY * multiplier + constant
        //multiplier = 1, constant = 0 -> ViewA.Thuộc tínhX = ViewB.Thuộc tínhY
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[blueRect]-40.0-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))//blueRect cách đáy 40 point

        
    }

}
