//
//  ServiceTableViewCell.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/11/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            checkService()
        } else {
            uncheckService()
        }
    }
    
    
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var serviceNameLabel: UILabel!
    private var checked: Bool = false
    
    func checkService() -> Void {
        print("Checking the service")
        checkboxImageView.image = UIImage(named: "Tick")
        checked = true
    }
    
    func uncheckService() -> Void {
        print("Unchecking the service")
        checkboxImageView.image = UIImage(named: "Tick No")
        checked = false
    }
    
    func isChecked() -> Bool {
        return checked
    }

    func setServiceName(to name: String) -> Void {
        serviceNameLabel.text = name
    }
    
    func toggleCheck() -> Void {
        if (checked) {
            uncheckService()
        } else {
            checkService()
        }
    }
}
