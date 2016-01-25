//
//  SHJTabbarView.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/22.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class SHJTabbarView: UIView {
    weak  var delegate: SHJSelectDelegate!
    @IBOutlet weak var BGVIew: UIView!
    @IBOutlet weak var AddButton: UIButton!
    var selectindex = 1
    var animation_state = 1
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    override func drawRect(rect: CGRect) {
        makeupUI()
    }
    func makeupUI(){
        self.frame = CGRectMake(0.0, Window_height-54, Window_width, 54)
        BGVIew.frame = self.bounds
        let postbtn = BGVIew.viewWithTag(100)! as! UIButton
        let jiange = (Window_width-54)/4.0 as CGFloat
        postbtn.frame = CGRectMake(jiange*2, 0, 54, 54)
        for i in 1...4{
            let btn = BGVIew.viewWithTag(i)! as! UIButton
            if i==1 {
                btn.frame = CGRectMake(0.0, 0, jiange, 54.0)
            } else if i == 2{
                btn.frame = CGRectMake(jiange,0, jiange, 54.0)
            }else if i == 3{
                btn.frame = CGRectMake(jiange*2+54,0, jiange, 54.0)
            }else if i == 4{
                btn.frame = CGRectMake(jiange*3+54,0, jiange, 54.0)
            }
            btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, -btn.imageView!.frame.size.width, -btn.imageView!.frame.size.height, 0.0);
            btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel!.frame.size.height, 0.0, 0.0, -btn.titleLabel!.frame.size.width)
        }
    }

    @IBAction func SelectTabbaritemAction(sender: UIButton) {
        if animation_state == 1{
            if (sender.tag==100){
                sender.selected = !sender.selected
                delegate.SHJSelectSendBack(100)
            }else{
                if(selectindex != sender.tag){
                sender.selected = true
                let btn = BGVIew.viewWithTag(selectindex)! as! UIButton
                btn.selected = false
                selectindex = sender.tag
                delegate.SHJSelectSendBack(sender.tag-1)
                }
            }
        }
    }
}
