//
//  FirstViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    var sourceArray:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()

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
            let path: String! = NSBundle.mainBundle().pathForResource("MenuList", ofType: "plist")
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
            cell.left_logo!.image = UIImage(named:(sourceArray[indexPath.section][indexPath.row]["LeftIcon"] as! NSString) as String)
            cell.right_logo!.image = UIImage(named:(sourceArray[indexPath.section][indexPath.row]["RightIcon"] as! NSString) as String)
            cell.left_titleLabel!.text = (sourceArray[indexPath.section][indexPath.row]["LeftTitle"] as! NSString) as String
            cell.right_titleLabel!.text = (sourceArray[indexPath.section][indexPath.row]["RightTitle"] as! NSString) as String
            cell.left_describelabel!.text = (sourceArray[indexPath.section][indexPath.row]["LeftRemark"] as! NSString) as String
            cell.right_describelabel!.text = (sourceArray[indexPath.section][indexPath.row]["RightRemark"] as! NSString) as String
            
            cell.left_button.addTarget(self,action:Selector("jumpToNextViewController:"),forControlEvents:.TouchUpInside)
            cell.right_button!.addTarget(self,action:Selector("jumpToNextViewController:"),forControlEvents:.TouchUpInside)
            return cell;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 64.0
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view:UIImageView = UIImageView.init(frame: CGRectMake(0.0, 0.0, self.view.bounds.size.width,30.0*self.view.bounds.size.width/320.0))
            view.image = UIImage.init(named:NSString.init(format:"First_section%d",section) as String)
            return view
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30.0*self.view.bounds.size.width/320.0
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 0.01
    }



}

