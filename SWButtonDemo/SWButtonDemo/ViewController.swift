//
//  ViewController.swift
//  SWButtonDemo
//
//  Created by SevenWang on 2017/2/4.
//  Copyright © 2017年 SevenWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView.init(frame: CGRect.init(x: 50, y: 250, width: 50, height: 50))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(view)
        let button = SWButton.init(frame: CGRect.init(x: 50, y: 250, width: 50, height: 50))
        button.path = getPath(frame: button.frame)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(tapButton(button:)), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getPath(frame:CGRect) -> UIBezierPath {
        let path = UIBezierPath.init()
        let h = sqrt(3.0) * frame.width / 4.0
        path.move(to: CGPoint.init(x: frame.width / 4.0, y: frame.width * 0.5 - h))
        path.addLine(to: CGPoint.init(x: frame.width / 2.0 + frame.width / 4.0, y: frame.width * 0.5 - h))
        path.addLine(to: CGPoint.init(x: frame.width, y: frame.width / 2.0))
        path.addLine(to: CGPoint.init(x: frame.width / 2.0 + frame.width / 4.0, y: frame.width * 0.5 + h))
        path.addLine(to: CGPoint.init(x: frame.width / 4.0, y: frame.width * 0.5 + h))
        path.addLine(to: CGPoint.init(x: 0, y: frame.width / 2.0))
        path.close()
        return path
    }
    
    func tapButton(button:UIButton) -> () {
        print("点击按钮")
    }
}

