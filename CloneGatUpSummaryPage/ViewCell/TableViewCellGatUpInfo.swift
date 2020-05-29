//
//  TableViewCellGatUpInfo.swift
//  CloneGatUpSummaryPage
//
//  Created by macOS on 5/28/20.
//  Copyright © 2020 macOS. All rights reserved.
//

import UIKit

class TableViewCellGatUpInfo: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var txtViewContent:UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
