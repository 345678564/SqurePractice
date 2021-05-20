//
//  SquareView.swift
//  navigationPractice01
//
//  Created by 김태완 on 2021/05/20.
//

import UIKit

class SquareView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(1)
        
//        let line = 10
        
        for h in 0 ... 9 {
            let horizontalOrigin = CGPoint(x: rect.minX, y: rect.minY + 1 / 10 * CGFloat(h) * rect.height)
            let horizontalTo = CGPoint(x: rect.width, y: horizontalOrigin.y)
            
            let verticalOrigin = CGPoint(x: rect.minX + 1 / 10 * CGFloat(h) * rect.width, y: rect.minY)
            let verticalTo = CGPoint(x: verticalOrigin.x, y: rect.maxY)
            
            context.move(to: horizontalOrigin)
            context.addLine(to: horizontalTo)
            
            context.move(to: verticalOrigin)
            context.addLine(to: verticalTo)
        }
        context.strokePath()
        
        
    }
    private func fillSqureColor(rect:CGRect) {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(rect: rect)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
        layer.addSublayer(shapeLayer)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else {
            return
        }
        print(location)
        let rect = CGRect(origin: location, size: CGSize(width: 10, height: 10))
        self.fillSqureColor(rect: rect)
    }
    
}
