//
//  ShjSegmentView.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class ShjSegmentView: UIView {
    @IBOutlet weak var Left_button: UIButton!
    @IBOutlet weak var Right_button: UIButton!
    weak  var delegate: ShjDelegate!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    override func drawRect(rect: CGRect) {
        makeupUI()
    }
    func makeupUI(){
        self.frame = CGRectMake(Window_width/2-65.0, 30, 130, 30)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor ( red: 0.215, green: 0.3733, blue: 0.9984, alpha: 1.0 ).CGColor as CGColorRef
    }

    @IBAction func selectAction(sender: UIButton) {
        if !sender.selected{
            if sender.tag == 0{
                Left_button.selected = true
                Right_button.selected = false
                Left_button.backgroundColor = UIColor ( red: 0.2745, green: 0.4784, blue: 1.0, alpha: 1.0 )
                Right_button.backgroundColor = UIColor.whiteColor()
            }else if sender.tag == 1{
                Left_button.selected = false
                Right_button.selected = true
                Right_button.backgroundColor = UIColor ( red: 0.2745, green: 0.4784, blue: 1.0, alpha: 1.0 )
                Left_button.backgroundColor = UIColor.whiteColor()
            }
            delegate.segmentSelectSendBack(sender.tag)
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
