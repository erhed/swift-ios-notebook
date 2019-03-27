//
//  NoteViewController.swift
//  Notebook
//
//  Created by Erik on 2019-03-18.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

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

        // UI
        let backButton = UIBarButtonItem()
        backButton.title = "Notes"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        // Show/hide keyboard functions
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.keyboardDismissMode = .onDrag
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // InfoCell
        if indexPath.row == 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! NoteInfoTableViewCell
            
            if self.newNote {
                cell.dateCreatedLabel.text = "2019-03-20"
                cell.dateLastModifiedLabel.text = "-"
            } else {
                cell.dateCreatedLabel.text = note?.created
                cell.dateLastModifiedLabel.text = note?.modified
            }
            
            return cell
            
        }
        // TextCell
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! NoteTextTableViewCell
            cell.textChanged {[weak tableView] (_) in
                DispatchQueue.main.async {
                    tableView?.beginUpdates()
                    tableView?.endUpdates()
                    
                    // Save for every keypress
                    if self.newNote {
                        self.note = Note(date: Date(), textContent: cell.noteTextView.text)
                        self.notebook?.add(note: self.note!)
                        //print("saved NEW")
                        self.newNote = false
                        self.noteIndex = (self.notebook?.count)! - 1
                    }
                    else {
                        //print("saved")
                        self.note?.textContent = cell.noteTextView.text
                        self.note?.dateLastModified = Date()
                        self.notebook?.save(index: self.noteIndex!, note: self.note!)
                    }
                }
            }
            
            if newNote {
                cell.noteTextView.becomeFirstResponder()
            } else {
                cell.noteTextView.text = note?.textContent
            }
            
            return cell
        }
    }
    
    // MARK: KEYBOARD EVENTS
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.micAndCameraView.frame.origin.y -= keyboardSize.height
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.micAndCameraView.frame.origin.y += keyboardSize.height
            })
        }
    }
}
