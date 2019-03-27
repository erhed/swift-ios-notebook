//
//  NoteListCell.swift
//  Notebook
//
//  Created by Erik on 2019-03-19.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteListCell: UITableViewCell {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addFadeOutToDescription()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addFadeOutToDescription() {
        let gradient = CAGradientLayer()
        gradient.frame = descriptionLabel.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        gradient.startPoint = CGPoint(x: 0.7, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        descriptionLabel.layer.mask = gradient
    }
}
