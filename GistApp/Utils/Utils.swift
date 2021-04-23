//
//  Utils.swift
//  GistApp
//
//  Created by ArjMaster on 21/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class Utils: NSObject {
    public override init() {}
    
    // MARK: - LAYOUT
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat, view: UIView) {
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [CACornerMask]
    }
    
    func roundedCorners(corners : UIRectCorner, radius : CGFloat, view: UIView) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
        view.layer.masksToBounds = true
    }
    
    func setColorBorderView(view: UIView, border: Int, radius: Int, _ color: CGColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.8039215686, alpha: 1)){
        view.layer.borderWidth = CGFloat(border);
        view.layer.borderColor = color;
        view.layer.cornerRadius = CGFloat(radius);
        view.layer.masksToBounds = true
    }
    
    func loadImage(url: String, image:UIImageView) {
        let imageUrl = URL(string: url)!
        let imageData = try! Data(contentsOf: imageUrl)
        image.image = UIImage(data: imageData)
    }

}
