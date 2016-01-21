//
//  ShjBaseViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit


class SHJBaseViewController: UIViewController {
    var Right_button: UIButton!
    var Title_label: UILabel!
    var NavigationBar:UIView!
    var Back_button:UIButton!
    var Nav_line:UIImageView!
    var Mysegment:ShjSegmentView!
    override func viewDidLoad() {
        super.viewDidLoad()
        creatNavigationBarView()
        view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }
    func creatNavigationBarView(){
        if NavigationBar == nil{
            NavigationBar = UIView.init(frame: CGRectMake(0, 0,Window_width, 64))
            NavigationBar.backgroundColor = UIColor.whiteColor()
            NavigationBar.tag = 100
            view.addSubview(NavigationBar)
        }
        
        if Title_label == nil{
            Title_label = UILabel.init(frame: CGRectMake(60,20,Window_width-120, 44))
            Title_label.backgroundColor = UIColor.whiteColor()
            Title_label.tag = 2
            Title_label.textAlignment = NSTextAlignment.Center
            Title_label.textColor = UIColor ( red: 0.0561, green: 0.0561, blue: 0.0561, alpha: 1.0 )
            NavigationBar.addSubview(Title_label)
        }
        if Back_button == nil{
            Back_button = UIButton.init(frame: CGRectMake(6,20,44, 44))
            Back_button.backgroundColor = UIColor.clearColor()
            //button 设置文字颜色
            Back_button.setTitleColor(UIColor(red: 0.0667, green: 0.0667, blue: 0.0667, alpha: 1.0), forState: UIControlState.Normal)
            Back_button.setImage(UIImage.init(named:"icon_back_normal"), forState: UIControlState.Normal)
            Back_button.addTarget(self, action: "backAction:", forControlEvents: UIControlEvents.TouchUpInside)
            Back_button.tag = 1
            NavigationBar.addSubview(Back_button)
        }
        if Right_button == nil{
            Right_button = UIButton.init(frame: CGRectMake(Window_width-50,20,44, 44))
            Right_button.backgroundColor = UIColor.clearColor()
            //button 设置文字颜色
            Right_button.setTitleColor(UIColor(red: 0.0667, green: 0.0667, blue: 0.0667, alpha: 1.0), forState: UIControlState.Normal)
            Right_button.addTarget(self, action: "rightAction:", forControlEvents: UIControlEvents.TouchUpInside)
            Right_button.tag = 3
            NavigationBar.addSubview(Right_button)
        }
        if Nav_line == nil{
            Nav_line = UIImageView.init(frame: CGRectMake(0,63,Window_width, 1))
            Nav_line.backgroundColor = UIColor ( red: 0.2567, green: 0.2567, blue: 0.2567, alpha: 1.0 )
            //button 设置文字颜色
            Nav_line.tag = 10
            NavigationBar.addSubview(Nav_line)
        }
    }
    func addSengmentView(lt:String,with rt:String){
        Title_label.removeFromSuperview()
        if Mysegment == nil{
            Mysegment = NSBundle.mainBundle().loadNibNamed("ShjSegmentView", owner: nil, options: nil).first as? ShjSegmentView
            Mysegment.Left_button.setTitle(lt, forState: UIControlState.Normal)
            Mysegment.Left_button.setTitle(lt, forState: UIControlState.Selected)
            Mysegment.Right_button.setTitle(rt, forState: UIControlState.Normal)
            Mysegment.Right_button.setTitle(rt, forState: UIControlState.Selected)
        }
        if NavigationBar == nil{
            NavigationBar = UIView.init(frame: CGRectMake(0, 0,Window_width, 64))
            NavigationBar.backgroundColor = UIColor.whiteColor()
            NavigationBar.tag = 100
            view.addSubview(NavigationBar)
        }
        NavigationBar.addSubview(Mysegment)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
    }

    func backAction(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    func rightAction(sender:UIButton){
        
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
