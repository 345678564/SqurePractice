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
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(1)
        
        
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
        print(bounds.width, bounds.height)

        let originX = CGFloat(Int(location.x * 10 / bounds.width))
        let originY = CGFloat(Int(location.y * 10 / bounds.height))
        
        print(originX, originY)
        
        let xPoint = originX * bounds.width / 10
        let yPoint = originY * bounds.height / 10
        
        let rect = CGRect(origin: CGPoint(x: xPoint, y: yPoint), size: CGSize(width: bounds.width / 10, height: bounds.height / 10))
        
        if rect.contains(location) {
            self.fillSqureColor(rect: rect)
        }
    }
    
}
