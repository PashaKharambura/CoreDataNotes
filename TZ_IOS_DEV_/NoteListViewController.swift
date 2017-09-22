//
//  NoteListViewController.swift
//  TZ_IOS_DEV_
//
//  Created by Pavlo Kharambura on 9/22/17.
//  Copyright © 2017 Pavlo Kharambura. All rights reserved.
//

import UIKit

class NoteListViewController: MyViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    var notes = [MyNote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            let note = notes[indexPath.row]
            context.delete(note)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()

            getData()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NoteTableViewCell
        let index = indexPath.row
        
        cell.titleLabel.text = notes[index].title
        cell.descriptLabel.text = notes[index].desc
        
        return cell
    }
    
    func getData() {
        
        do {
            notes = try context.fetch(MyNote.fetchRequest())
        }
        catch {
            AlertDialog.showAlert("Помилка", message: "Помилка при загрузці записів", viewController: self)
        }
    }
    
}
