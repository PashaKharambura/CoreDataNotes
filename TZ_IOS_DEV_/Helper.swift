//
//  Helper.swift
//  TZ_IOS_DEV_
//
//  Created by Pavlo Kharambura on 9/22/17.
//  Copyright © 2017 Pavlo Kharambura. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class Helper {
    
    static let instance = Helper()
    var notesCD = [MyNote]()
    
    
    func fetchMyData(context: NSManagedObjectContext, VC: UIViewController, completion: @escaping ()->Void ) {
        do {
            notesCD = try context.fetch(MyNote.fetchRequest())
        }
        catch {
            AlertDialog.showAlert("Помилка", message: "Помилка при загрузці записів", viewController: VC)
        }
        completion()
    }
    
    func addMyData(delegate: AppDelegate, context: NSManagedObjectContext, title: String, desc: String) {
       
        let note = MyNote(context: context)
        note.title = title
        note.desc = desc
        
        delegate.saveContext()
    }
    
}
