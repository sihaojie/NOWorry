//
//  dailyListCell.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/22.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class dailyListCell: UITableViewCell {

    @IBOutlet weak var details_Label: UILabel!
    @IBOutlet weak var creator_Label: UILabel!
    @IBOutlet weak var time_Label: UILabel!
    @IBOutlet weak var title_Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateWith(item:reportItem) {
        title_Label.text = item.reportTitle
        creator_Label.text = "由\(item.createname!)创建"
        time_Label.text = item.reportstartdate
        details_Label.text = item.describe
        if item.level == "1"{
            self.contentView.backgroundColor = UIColor.redColor()
        }else{
            self.contentView.backgroundColor = UIColor.whiteColor()
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
