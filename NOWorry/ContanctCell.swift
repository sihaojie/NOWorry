//
//  ContanctCell.swift
//  NOWorry
//
//  Created by sihaojie on 16/4/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit

class ContanctCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departMentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateWith(item:contanct){
        phoneLabel.text = item.account
        nameLabel.text = item.name
        departMentLabel.text = item.departmentName
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
