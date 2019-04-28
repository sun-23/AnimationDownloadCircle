//
//  ViewController.swift
//  CircularLoaderLBTA
//
//  Created by Brian Voong on 12/8/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let's start by drawing a circle somehow
        
        let center = view.center
        
        // create my track layer
        let trackLayer = CAShapeLayer()
        
        // สร้างวงกลม
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor // สีวงรอบนอกที่เป็นด้านหลัง สีวงรอบนอกที่เป็น action
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor // สีด้านใน
        trackLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(trackLayer) //append layer
        
//        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.yellow.cgColor //สีวงรอบนอกที่เป็น action
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor //สีด้านในของ action
        shapeLayer.lineCap = kCALineCapRound // style ของเส้น วงรอบนอก ที่เป็นหัวท้ายแบบโค้งมน
        
        shapeLayer.strokeEnd = 0 // ตำแหน่งสัมพัทธ์ที่จะหยุดการลูบเส้นทาง Animation วงรอบนอกที่เป็น action
        
        view.layer.addSublayer(shapeLayer) //append layer
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))// add tap action
        
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 2 // Action of loopLine time
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false // ถ้าวน loop action เสร็จๆให้หายไป แต่เรา ทำเป็น false มันจึงไม่หายไป
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic") //add animation
    }

}
















