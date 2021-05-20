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
        
//        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//
//        context.move(to: CGPoint(x: 0, y: 0 + 1 / 10 * rect.height))
//        context.addLine(to: CGPoint(x: rect.width, y: 0 + 1 / 10 * rect.height))
        
        context.strokePath()
    }
}
