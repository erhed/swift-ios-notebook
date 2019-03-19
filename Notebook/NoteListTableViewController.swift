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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<3 {
            let note = Note(date: Date(), textContent: "Note #\(index) baltabaltavalta mmmeeee meeeee")
            notebook.add(note: note)
        }
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
}
