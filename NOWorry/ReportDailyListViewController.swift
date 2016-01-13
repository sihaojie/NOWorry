//
//  ReportDailyListViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class ReportDailyListViewController: ShjBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Title_label.text = "工作日程"
//        addSengmentView("自己",with: "公司")
//        Mysegment.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func segmentSelectSendBack(index: Int) {
        print(index)
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
