//
//  ReportDailyListViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit
import SwiftyJSON
import TTReflect
class reportItem:NSObject{
    var id: CLongLong = 0
    
    var isCreator: String?
    
    var projectname: String?
    
    var commentCounts: CLongLong = 0
    
    var describe: String?
    
    var isedit: String?
    
    var level: String?
    
    var reportTitle: String?
    
    var behFlowId: CLongLong = 0
    
    var projectId: String?
    
    var openflag: String?
    
    var createname: String?
    
    var reportenddate: String?
    
    var reportstartdate: String?
    
    var shareemployee: String?
}

class ReportDailyListViewController: SHJBaseViewController,SHJRequestDelegate {
    var report_list:Array<reportItem>! = Array()
    var table:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Title_label.text = "工作日程"
//        addSengmentView("自己",with: "公司")
//        Mysegment.delegate = self
        table = UITableView.init(frame: CGRectMake(0, 64, Window_width, Window_height-64))
        self.view.addSubview(table)
        weak var s_delegate = self;
        s_request.request(withURL: reportdailyList, withParams: ["currentpage":"1","keyword":"2016-01-18"], withKeyArr: ["username","currentpage","keyword"], withDelegate:s_delegate, With: 1)
        print(s_request.username)
        // Do any additional setup after loading the view.
    }
    func segmentSelectSendBack(index: Int) {
        print(index)
    }
    func requestFail(error: NSError, with tag:Int) {
        
    }
    func requestFinishedNOresult(with message: String, and tag: Int) {
        if (message == "尚未登录成功，请稍后重试"){
            let cancelAction = UIAlertController.init(title: "尚未登录成功", message: "请稍后重试", preferredStyle:UIAlertControllerStyle.Alert)
            self.presentViewController(cancelAction, animated:true, completion: { () -> Void in
                
            })

        }
    }
    func requestFinished(result:JSON, with tag: Int) {
        if result["code"].intValue == 100{
            report_list.removeAll()
            report_list.appendContentsOf(Reflect.modelArray(result["dailyreports"].arrayObject, type: reportItem.self)!)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
