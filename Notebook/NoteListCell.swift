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
        addFadeOut()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addFadeOut() {
        let gradient = CAGradientLayer()
        gradient.frame = descriptionLabel.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        
        //Get Height and width
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        //Calculate the start points and end points
        let startPointX = CGFloat(0)
        let startPointY = (height/2)/height
        let endPointX = CGFloat(1)
        let endPointY = (height/2)/height
        
        gradient.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradient.endPoint = CGPoint(x: endPointX, y: endPointY)
        descriptionLabel.layer.mask = gradient
    }
}
