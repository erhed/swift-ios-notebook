//
//  NoteViewController.swift
//  Notebook
//
//  Created by Erik on 2019-03-18.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var noteTextField: UITextView!
    
    var notebook: Notebook?
    var note: Note?
    var noteIndex: Int?
    var newNote: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTextField.delegate = self
        //noteTextField.keyboardDismissMode = .interactive

        // UI
        let backButton = UIBarButtonItem()
        backButton.title = "Notes"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        noteTextField.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        // Create or show - keyboard, title & content
        if newNote {
            noteTextField.becomeFirstResponder()
            self.title = "New"
        }
        else {
            self.title = note?.created
            noteTextField.text = note?.textContent
        }
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        if !newNote {
            notebook?.delete(noteAtIndex: noteIndex!)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if newNote {
            note = Note(date: Date(), textContent: noteTextField.text)
            notebook?.add(note: note!)
            //print("saved NEW")
            newNote = false
            noteIndex = (notebook?.count)! - 1
        }
        else {
            //print("saved")
            note?.textContent = noteTextField.text
            note?.dateLastModified = Date()
            notebook?.save(index: noteIndex!, note: note!)
        }
    }
}
