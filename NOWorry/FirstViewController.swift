//
//  FirstViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit
import Alamofire
import BRYXBanner

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    var sourceArray:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true

//        Alamofire.request(.POST, "http://web.ibumobile.com/head-ClientLogin-getLogin.do", parameters: ["data": "{\"userid\":\"\",\"channelid\":\"\",\"devicetype\":\"4\"}","authcode":"","password":"187e7c3ce1435f93ea030a8acfb08983","username":"69299a73775a799cb135cedd36497606","signiture":"918bd7616fc7e72ec4359cae9e29f650f8a34062"],ParameterEncoding : .URL,headers:["imei":"80bfc6e10a24a6827f974acc3f282d4e1a2c25e4","seed":"25316011","version":"V2R20A20P1"])
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.result)   // result of response serialization
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }
        self.navigationController?.navigationBarHidden = true
        reloadSoure()
        tableview!.registerNib(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier:"Cell" )
        tableview.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
    /*!
    初始化数据源
    */
    
    func reloadSoure(){
            let path: String! = Shj_mainPath("MenuList", withtype: "plist")
            sourceArray = NSMutableArray(contentsOfFile: path)
    }
    
    func jumpToNextViewController(sender:UIButton!){
        let label = sender.superview!.viewWithTag(11)! as!UILabel
        switch label.text! as String{
            case "我的消息":
                print("我的消息")
            case "移动签到":
                print("我的消息")
            case "工作日程":
                self.navigationController?.pushViewController(ReportDailyListViewController.init(), animated: true)
            case "工作流程":
                print("工作流程")
            case "公司发文":
                print("公司发文")
            case "周报月报":
                print("周报月报")
            case "优惠流量":
                print("优惠流量")
            case "流量红包":
                print("流量红包")
            case "企业客户":
                print("企业客户")
            case "企业联系人":
                print("企业联系人")
            case "团队管理":
                print("团队管理")
            case "销售机会":
                print("销售机会")
            case "数据分析":
                print("数据分析")
            case "商品信息":
                print("商品信息")
            case "销售审批":
                print("销售审批")
            case "订单中心":
                print("订单中心")
            default:
                break
        }
        let banner = Banner(title: "Image Notification", subtitle: "Here's a great image notification.", image: UIImage(named: "Icon"), backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000))
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var number :Int = 0
            switch section{
        case 0:
            number = 3
        case 1:
            number = 1
        case 2:
            number = 4
        default:
            number = 0
            }
            return number
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 3;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:HomeTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:  indexPath) as! HomeTableViewCell
        if sourceArray[indexPath.section].count == 1{
            cell.UpLine.hidden = false
            cell.Left_DownLine.hidden = true
            cell.Right_downline.hidden = true
            cell.DownLine.hidden = false
        }else if sourceArray[indexPath.section].count>1 {
            if indexPath.row==0{
                cell.UpLine.hidden = false
                cell.Left_DownLine.hidden = false
                cell.Right_downline.hidden = false
                cell.DownLine.hidden = true
        }else if indexPath.row == sourceArray[indexPath.section].count - 1{
                cell.UpLine.hidden = true
                cell.Left_DownLine.hidden = true
                cell.Right_downline.hidden = true
                cell.DownLine.hidden = false
        }else{
                cell.UpLine.hidden = true
                cell.Left_DownLine.hidden = false
                cell.Right_downline.hidden = false
                cell.DownLine.hidden = true
            }
        }
        
        cell.left_logo!.image = UIImage.init(contentsOfFile: Shj_mainPath((sourceArray[indexPath.section][indexPath.row].objectForKey("LeftIcon") as! NSString) as String, withtype: "png"))
        cell.right_logo!.image = UIImage.init(contentsOfFile: Shj_mainPath((sourceArray[indexPath.section][indexPath.row].objectForKey("RightIcon") as! NSString) as String, withtype: "png"))

        cell.left_titleLabel!.text = (sourceArray[indexPath.section][indexPath.row].objectForKey("LeftTitle") as! NSString) as String
        cell.right_titleLabel!.text = (sourceArray[indexPath.section][indexPath.row].objectForKey("RightTitle") as! NSString) as String
        cell.left_describelabel!.text = (sourceArray[indexPath.section][indexPath.row].objectForKey("LeftRemark") as! NSString) as String
        cell.right_describelabel!.text = (sourceArray[indexPath.section][indexPath.row].objectForKey("RightRemark") as! NSString) as String
        
        cell.left_button.addTarget(self,action:Selector("jumpToNextViewController:"),forControlEvents:.TouchUpInside)
        cell.right_button!.addTarget(self,action:Selector("jumpToNextViewController:"),forControlEvents:.TouchUpInside)
        /*
        let animation = CATransition()
        animation.delegate = self;
        
        animation.duration = 1;
        
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear);
        
        animation.fillMode = kCAFillModeForwards;
        
        animation.type = "curlDown";
        
        animation.subtype = kCATransitionFromRight;
        
        animation.startProgress = 0.0;
        
        animation.endProgress = 1.0;
        
        animation.removedOnCompletion = false;
        cell.layer.addAnimation(animation, forKey: "animation")
        */

        return cell;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 64.0
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view:UIImageView = UIImageView.init(frame: CGRectMake(0.0, 0.0, self.view.bounds.size.width,30.0*self.view.bounds.size.width/320.0))
            view.image = UIImage.init(contentsOfFile: Shj_mainPath(NSString.init(format:"First_section%d",section) as String, withtype: "png"))
            return view
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30.0*self.view.bounds.size.width/320.0
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 0.01
    }



}

