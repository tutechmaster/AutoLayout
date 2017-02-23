//Vẽ một hình chữ nhật, kích thước co dãn theo kích thước

import UIKit

class CenterAll: UIViewController {
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        let blueRect = UIImageView(image: UIImage(named: "playboy.jpg"))
        blueRect.contentMode = UIViewContentMode.scaleAspectFit
        blueRect.backgroundColor = UIColor.blue

        self.view.addSubview(blueRect)
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view": self.view, "blueRect": blueRect]

        //Căn giữa trục X - trục hoành
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        
        //Căn giữa trục Y - trục tung
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        
        //Vertical space: cách top, cách bottom 40 point
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect]-40.0-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
        //Horizontal space: cách left, cách right 40 point
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40.0-[blueRect]-40.0-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
    }

}
