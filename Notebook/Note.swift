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
    let dateFormatterWithTime = DateFormatter()
    var textContent: String
    
    var description: String {
        let text = textContent.substring(toIndex: 50)
        let formatText = String(text.filter { !"\n\t\r".contains($0) })
        return formatText
    }
    
    var created: String {
        return dateFormatter.string(from: dateCreated)
    }
    
    var modified: String {
        return dateFormatterWithTime.string(from: dateLastModified)
    }
    
    func updateLastModified(date: Date) {
        self.dateLastModified = date
    }
    
    init(date: Date, textContent: String) {
        self.dateCreated = date
        self.dateLastModified = date
        self.textContent = textContent
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatterWithTime.dateFormat = "yyyy-MM-dd HH:mm"
    }
    
}
