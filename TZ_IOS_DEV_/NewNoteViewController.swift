//
//  NewNoteViewController.swift
//  TZ_IOS_DEV_
//
//  Created by Pavlo Kharambura on 9/22/17.
//  Copyright © 2017 Pavlo Kharambura. All rights reserved.
//

import UIKit

class NewNoteViewController: MyViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton! {
        didSet{
            saveButton.layer.cornerRadius = 12
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addNote(_ sender: Any) {
        
        if titleTextField.text != "" && descriptionTextField.text != "" {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            
            let note = MyNote(context: context)
            note.title = titleTextField.text
            note.desc = descriptionTextField.text 
            
            delegate.saveContext()
            
            navigationController?.popViewController(animated: true)
        } else {
            AlertDialog.showAlert("Помилка", message: "Заповніть будь ласка усі поля", viewController: self)
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
