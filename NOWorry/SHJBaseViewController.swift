//
//  SHJBaseViewController.swift
//  NOWorry
//
//  Created by sihaojie on 16/4/18.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class SHJBaseViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var NavigationBar: UIView!
    @IBOutlet weak var Right_button: UIButton!
    @IBOutlet weak var Title_label: UILabel!
    @IBOutlet weak var Back_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true);
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
