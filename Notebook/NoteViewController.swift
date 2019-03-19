//
//  NoteViewController.swift
//  Notebook
//
//  Created by Erik on 2019-03-18.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var noteText: UITextView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        noteText.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        noteText.becomeFirstResponder()
        
        self.title = "Note"
    }
}
