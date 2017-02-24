# Ứng dụng demo Autolayout
1. Layout căn bản: width, height, x, y: width2 = a * width1 + b 
2. Layout có tham số metrics, options
3. Layout có thứ tự ưu tiên, priority
4. Size class
5. Cú pháp visual Layout
6. Thêm bớt constraint trong lúc runtime
7. Xử lý vấn đề performance suy giảm khi có quá nhiều constrainst. Tú hãy tìm ra cái gì của riêng em

# Lược đồ mindmap để học viên ghi nhớ về Autolayout

# Fix lỗi

Code sau đây gây lỗi

```swift
  let views = ["view": self.view, "blueRect": blueRect]
  self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect(100)]", options: [], metrics: nil, views: views))
```

Tham khảo [http://stackoverflow.com/questions/39520534/autolayout-issue-xcode-8-swiftvalue-nsli-superitem](http://stackoverflow.com/questions/39520534/autolayout-issue-xcode-8-swiftvalue-nsli-superitem), bổ xung kiểu tường minh cho views là [String:UIView] là được.

```swift
  let views: [String:UIView] = ["view": self.view, "blueRect": blueRect]
  self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40.0-[blueRect(100)]", options: [], metrics: nil, views: views))
```


