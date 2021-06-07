//
//  SquareView.swift
//  navigationPractice01
//
//  Created by 김태완 on 2021/05/20.
//

import UIKit

struct GridCell {
    var layer: CAShapeLayer
    var row: Int
    var col: Int
    var hasTouched: Bool
}

class SquareView: UIView {
    
    var cells: [GridCell] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(1)
        context.setStrokeColor(UIColor.black.cgColor)
        let diameter = rect.width / 10
        for i in 1 ..< 10 {
            context.move(to: CGPoint(x: CGFloat(i) * diameter, y: rect.minY))
            context.addLine(to: CGPoint(x: CGFloat(i) * diameter, y: rect.maxY))
            
            context.move(to: CGPoint(x: rect.minX, y: CGFloat(i) * diameter))
            context.addLine(to: CGPoint(x: rect.maxX, y: CGFloat(i) * diameter))
        }
        context.strokePath()
    }
    
    private func fillRect(_  rect: CGRect, row: Int, col: Int) {

        for i in 0 ..< cells.count {
            if cells[i].row == row && cells[i].col == col {
                cells[i].hasTouched = !cells[i].hasTouched
                cells[i].layer.fillColor = cells[i].hasTouched ? UIColor.blue.cgColor : UIColor.clear.cgColor
                return
            }
        }
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 0).cgPath
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.blue.cgColor
        layer.addSublayer(shapeLayer)
        cells.append(GridCell(layer: shapeLayer, row: row, col: col, hasTouched: true))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        
        let col = Int(location.x / (frame.width / 10))
        let row = Int(location.y / (frame.width / 10))
        if col < 0 || col >= 10 || row < 0 || row >= 10 { return }
        let rect = getTouchedRect(col: col, row: row)
        fillRect(rect, row: row, col: col)
    }
    
    private func getTouchedRect(col: Int, row: Int) -> CGRect {
        
        let originX = CGFloat(col) * (frame.width / 10) + 0.5
        let originY = CGFloat(row) * (frame.width / 10) + 0.5
        
        return CGRect(origin: CGPoint(x: originX, y: originY), size: CGSize(width: frame.width / 10 - 1, height: frame.width / 10 - 1))
    }


//    var cells: [GridCell] = []
//
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//
//        let lineWidth: CGFloat = 2
//        var row: Int = 10
//        row = #column
//
//        let context = UIGraphicsGetCurrentContext()!
//        context.setStrokeColor(UIColor.black.cgColor)
//        context.setLineWidth(lineWidth)
//
//
//        for h in 0 ..< row {
//            let horizontalOrigin = CGPoint(x: rect.minX, y: rect.minY + 1 / 10 * CGFloat(h) * rect.height)
//            let horizontalTo = CGPoint(x: rect.width, y: horizontalOrigin.y)
//
//            let verticalOrigin = CGPoint(x: rect.minX + 1 / 10 * CGFloat(h) * rect.width, y: rect.minY)
//            let verticalTo = CGPoint(x: verticalOrigin.x, y: rect.maxY)
//
//            context.move(to: horizontalOrigin)
//            context.addLine(to: horizontalTo)
//
//            context.move(to: verticalOrigin)
//            context.addLine(to: verticalTo)
//        }
//        context.strokePath()
//
//
//    }
//    private func fillSqureColor(_ rect:CGRect, row: Int, col: Int) {
//
//        for i in 0 ..< cells.count {
//            if cells[i].row == row && cells[i].col == col {
//                cells[i].hasTouched = !cells[i].hasTouched
//                cells[i].layer.fillColor = cells[i].hasTouched ? UIColor.black.cgColor : UIColor.clear.cgColor
//
//                return
//            }
//        }
//
//        let shapeLayer = CAShapeLayer()
//        let path = UIBezierPath(rect: rect)
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = UIColor.black.cgColor
//        shapeLayer.strokeColor = UIColor.red.cgColor
//
//        layer.addSublayer(shapeLayer)
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let location = touches.first?.location(in: self)
//        else {
//            return
//        }
//        print(location)
////        print(bounds.width, bounds.height)
//
//        let originX = CGFloat(Int(location.x * 10 / bounds.width))
//        let originY = CGFloat(Int(location.y * 10 / bounds.height))
//
//        print(originX, originY)
//
//        let xPoint = originX * bounds.width / 10
//        let yPoint = originY * bounds.height / 10
//
//        let rect = CGRect(origin: CGPoint(x: xPoint, y: yPoint), size: CGSize(width: bounds.width / 10, height: bounds.height / 10))
//
//
//
//        if rect.contains(location) {
//            fillSqureColor(rect, row: Int(xPoint), col: Int(yPoint))
//        }
//    }
}

//struct GridCell {
//    var layer: CAShapeLayer
//    var row: Int
//    var col: Int
//    var hasTouched: Bool
//}
