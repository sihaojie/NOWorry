//
//  SecondViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift
import TTReflect

class contanct:Object{
    var account: String?
    
    var departmentCode: String?
    
    var projectname: String?
    
    var departmentId: CLongLong = 0
    
    var departmentName: String?
    
    var headerImg: String?
    
    var id: CLongLong = 0
    
    var name: String?
    
    var phone: String?
    
    var sex: String?
    
}

class SecondViewController: UIViewController,SHJRequestDelegate {
    
    var contanct_list:Array<contanct>! = Array()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        weak var s_delegate = self
        s_request.request(withURL: "client/projectChange-ProjectChange-getEmployeeList100.do", withParams: ["username":"18588446500","currentpage":"1","flag":"1"], withKeyArr: ["username","currentpage","flag"], withDelegate:s_delegate, With: 1)

        table.registerNib(UINib.init(nibName:"ContanctCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func requestFinished(result: JSON,with tag:Int) {
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
                contanct_list.appendContentsOf(Reflect.modelArray(json: result["items"].arrayObject, type: contanct.self))
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
        
    }
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


}

