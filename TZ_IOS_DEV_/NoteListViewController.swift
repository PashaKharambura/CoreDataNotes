//
//  NoteListViewController.swift
//  TZ_IOS_DEV_
//
//  Created by Pavlo Kharambura on 9/22/17.
//  Copyright © 2017 Pavlo Kharambura. All rights reserved.
//

import UIKit

class NoteListViewController: MyViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var detailsVIew: UIView! {
        didSet {
            detailsVIew.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var blurLabelTitle: UILabel!
    @IBOutlet weak var blurTextDescript: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    override func viewDidLoad() {
        super.viewDidLoad()

        blurView.alpha = 0
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        Helper.instance.fetchMyData(context: context, VC: self, completion: tableView.reloadData)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            let note = Helper.instance.notesCD[indexPath.row]
            context.delete(note)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()

            Helper.instance.fetchMyData(context: context, VC: self, completion: tableView.reloadData)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Helper.instance.notesCD.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NoteTableViewCell
        let index = indexPath.row
        
        cell.titleLabel.text = Helper.instance.notesCD[index].title
        cell.descriptLabel.text = Helper.instance.notesCD[index].desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 0.85
            self.blurLabelTitle.text = Helper.instance.notesCD[indexPath.row].title
            self.blurTextDescript.text = Helper.instance.notesCD[indexPath.row].desc
        }
    }
    
    @IBAction func closeBlurView(_ sender: Any) {
        UIView.animate(withDuration: 0.5) { 
            self.blurView.alpha = 0
        }
    }

}
