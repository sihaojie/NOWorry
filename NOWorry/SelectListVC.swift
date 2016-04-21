//
//  SelectListVC.swift
//  NOWorry
//
//  Created by sihaojie on 16/4/14.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit
import SwiftyJSON
import TTReflect
import RealmSwift

class SelectListVC: SHJBaseViewController,UITableViewDataSource,UITableViewDelegate {
    var contanct_list:Array<contanct>! = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        print(realm.path)
        try! realm.write {
            realm.deleteAll()
            realm.add(contanct_list)
        }
        Title_label.text = "多选"
        //        addSengmentView("自己",with: "公司")
        //        Mysegment.delegate = self
        print(s_request.username)
        table.registerNib(UINib.init(nibName: "dailyListCell", bundle: nil), forCellReuseIdentifier:"Cell" )
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /* func requestFinished(result: JSON,with tag:Int) {
        print(result);
        if tag == 1{
            if result["code"].intValue == 100{
                if (result["currentpage"].intValue == 1){
                    contanct_list.removeAll()
                }else{
                    if(result["currentpage"].intValue<result["totalpage"].intValue){
                        weak var s_delegate = self
                        s_request.request(withURL: "client/projectChange-ProjectChange-getEmployeeList100.do", withParams: ["username":"18588446500","currentpage":"\(result["currentpage"].intValue+1)","flag":"1"], withKeyArr: ["username","currentpage","flag"], withDelegate:s_delegate, With: 1)
                    }
                }
                contanct_list.appendContentsOf(Reflect.modelArray(result["items"].arrayObject, type: contanct.self)!)
                let realm = try! Realm()
                print(realm.path)
                try! realm.write {
                    realm.deleteAll()
                    realm.add(contanct_list)
                }
                table.reloadData()
            }else{
                
            }
        }
    }
    func requestFail(error: NSError, with tag: Int) {
        
    }
    
    func requestFinishedNOresult(with message: String, and tag: Int) {
        
    } */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contanct_list.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ContanctCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:  indexPath) as! ContanctCell
        cell.updateWith(contanct_list[indexPath.row])
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
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
