//
//  NoteTextTableViewCell.swift
//  Notebook
//
//  Created by Erik on 2019-03-20.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteTextTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var noteTextView: UITextView!
    
    var textChanged: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        noteTextView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textChanged(action: @escaping (String) -> Void) {
        self.textChanged = action
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textChanged?(noteTextView.text)
    }

}
