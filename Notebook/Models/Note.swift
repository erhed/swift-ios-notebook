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
    let dateFormatterDate = DateFormatter()
    let dateFormatterTime = DateFormatter()
    var textContent: String
    
    var description: String {
        let text = textContent.substring(toIndex: 50)
        //let formatText = String(text.filter { !"\n\t\r".contains($0) }) // Show text from more than first line
        return text
    }
    
    var created: String {
        return dateFormatterDate.string(from: dateCreated)
    }
    
    var modified: String {
        return dateFormatterDate.string(from: dateLastModified)
    }
    
    func updateLastModified(date: Date) {
        self.dateLastModified = date
    }
    
    init(date: Date, textContent: String) {
        self.dateCreated = date
        self.dateLastModified = date
        self.textContent = textContent
        dateFormatterDate.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatterTime.dateFormat = "HH:mm"
    }
    
}
