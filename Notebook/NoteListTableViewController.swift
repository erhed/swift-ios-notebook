//
//  NoteListTableViewController.swift
//  Notebook
//
//  Created by Erik on 2019-03-18.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    
    
    let notebook = Notebook()
    let createNoteSegueID = "createNoteSegue"
    let showNoteSegueID = "showNoteSegue"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notes"
        
        for index in 0..<3 {
            let note = Note(date: Date(), textContent: "Note #\(index) baltabaltavalta mmmeeee meeeeek reee")
            notebook.add(note: note)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notebook.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.0;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteListCell", for: indexPath) as! NoteListCell
        
        if let note = notebook.note(index: indexPath.row) {
            cell.dateLabel?.text = "\(note.created)"
            cell.descriptionLabel?.text = "\(note)"
        }
        
        return cell
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showNoteSegueID {
            if let destination = segue.destination as? NoteViewController,
                let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell),
                let note = notebook.note(index: indexPath.row) {
                destination.notebook = notebook
                destination.note = note
                destination.newNote = false
                destination.noteIndex = indexPath.row
            }
        }

        if segue.identifier == createNoteSegueID {
            if let destination = segue.destination as? NoteViewController {
                destination.notebook = notebook
                destination.newNote = true
            }
        }
    }
}
