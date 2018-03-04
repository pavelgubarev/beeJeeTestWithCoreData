//
//  ViewContactTableViewCell.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import UIKit

class EditContactTableViewCell: UITableViewCell {
    
    weak var owner : EditTableViewController!
    
    var rowNumber : Int = 0
    
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var fieldValue: UITextField!

    @IBAction func editingChanged(_ sender: Any) {
        
        owner.updateField(number: rowNumber, value: fieldValue.text!)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
