 //
//  DetailViewController.swift
//  ToDoList
//
//  Created by 18ericz on 2/10/19.
//  Copyright © 2019 18ericz. All rights reserved.
//

import UIKit
 
class DetailViewController: UIViewController {
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoNotesField: UITextView!
    @IBOutlet weak var toDoField: UITextField!
    var toDoNotesItem: String?
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        } else{
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNotesItem = toDoNotesItem{
            toDoNotesField.text = toDoNotesItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNotesItem =  toDoNotesField.text
        }
    }
    
    func enableDisableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
        //        if toDoField.text!.count > 0 {
        //            saveBarButton.isEnabled = true
        //        }else {
        //            saveBarButton.isEnabled = false
        //        }
    }
    @IBAction func toDoFieldChange(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
        
        
    
    @IBAction func cancelPressed(_ sender: Any) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
