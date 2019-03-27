//
//  Notebook.swift
//  Notebook
//
//  Created by Erik on 2019-03-19.
//  Copyright © 2019 Erik. All rights reserved.
//

import Foundation

class Notebook {
    
    private var notes = [Note]()
    
    var count: Int {
        return notes.count
    }
    
    func add(note: Note) {
        notes.append(note)
    }
    
    func note(index: Int) -> Note? {
        if index >= 0 && index <= notes.count {
            return notes[index]
        }
        return nil
    }
    
    func save(index: Int, note: Note) {
        notes[index] = note
    }
    
    func delete(noteAtIndex index: Int) {
        notes.remove(at: index)
    }
}
