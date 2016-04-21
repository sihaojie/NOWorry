//
//  SHJTabbarViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/22.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class SHJTabbarViewController: UITabBarController,SHJSelectDelegate {
    var bgview:UIView!
    var scview:SHJshortcutsView!
    var customTabbar:SHJTabbarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /* customTabbar = NSBundle.mainBundle().loadNibNamed("SHJTabbarView", owner: nil, options: nil).first as? SHJTabbarView
        self.tabBar.hidden = true
        self.view.addSubview(customTabbar!)
        customTabbar?.delegate = self
        bgview = UIView.init(frame: self.view.bounds)
        bgview.backgroundColor = UIColor.whiteColor()
        bgview.alpha = 0.8
        self.view.addSubview(bgview)
        let tap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: "hidenedShortcutsView")
        bgview.addGestureRecognizer(tap)
        bgview.hidden = true
        scview =  NSBundle.mainBundle().loadNibNamed("SHJshortcutsView", owner: nil, options: nil).first as? SHJshortcutsView
        self.view.addSubview(scview) */
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func SHJSelectSendBack(index: Int) {
        if index != 100{
            self.selectedIndex = index
        }else if index == 100{
            self.showShortcutsView()
        }
    }
    func showShortcutsView(){
        bgview.hidden = false
        scview.frame = CGRectMake(Window_width-137, Window_height-329, 137, 275)
    }
    func hidenedShortcutsView(){
        bgview.hidden = true
        scview.frame = CGRectMake(Window_width, Window_height-329, 137, 275)
        customTabbar.AddButton.selected = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
