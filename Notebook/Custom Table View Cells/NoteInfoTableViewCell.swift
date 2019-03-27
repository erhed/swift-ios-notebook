//
//  NoteInfoTableViewCell.swift
//  Notebook
//
//  Created by Erik on 2019-03-20.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var dateLastModifiedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
