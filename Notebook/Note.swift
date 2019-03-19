//
//  Note.swift
//  Notebook
//
//  Created by Erik on 2019-03-19.
//  Copyright © 2019 Erik. All rights reserved.
//

import Foundation

class Note: CustomStringConvertible {
    
    var dateCreated: Date
    var dateLastModified: Date
    let dateFormatter = DateFormatter()
    var textContent: String
    
    var description: String {
        return textContent.substring(toIndex: 30)
    }
    
    var created: String {
        return dateFormatter.string(from: dateCreated)
    }
    
    var modified: String {
        return dateFormatter.string(from: dateLastModified)
    }
    
    func updateLastModified(date: Date) {
        self.dateLastModified = date
    }
    
    init(date: Date, textContent: String) {
        self.dateCreated = date
        self.dateLastModified = date
        self.textContent = textContent
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
}
