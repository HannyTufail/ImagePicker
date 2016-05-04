//
//  RoundUIImageView.swift
//  ImagePicker
//
//  Created by zaktech on 5/2/16.
//  Copyright © 2016 zaktech. All rights reserved.
//

import UIKit

class RoundImageView : UIImageView {
    
//    @IBInspectable let corner_radius : Double?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
        configureViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViewLayout()
    }
    
    func configureViewLayout() {
        
        self.layer.masksToBounds = true;
        self.layer.cornerRadius = CGFloat(120);
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 5.0
    }
    
    func tintImageColor(color:UIColor) {
        
        self.image = self.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        self.tintColor = UIColor.blueColor()
    }
    
}