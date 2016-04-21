//
//  SHJshortcutsView.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/22.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class SHJshortcutsView: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    override func drawRect(rect: CGRect) {
        makeupUI()
    }
    func makeupUI(){
        self.frame = CGRectMake(Window_width, Window_height-329, 137, 275)
    }

}
