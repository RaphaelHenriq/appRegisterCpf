//
//  ListingCpfViewModel.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import Foundation
import UIKit
import CoreData

class ListingCpfViewModel {
    
    // MARK: - Class properties
    
    var context: NSManagedObjectContext!
    
    // MARK: - Public properties
    
    var Cpf: [NSManagedObject] = []
    
    // MARK: - Class methods
    
    func coreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }

    func getCpf(reloadTableView: UITableView) {
        let requisition = NSFetchRequest<NSFetchRequestResult>(entityName: "Cpf")
        do {
            let requisitionGet = try context.fetch(requisition)
            self.Cpf = requisitionGet as! [NSManagedObject]
            reloadTableView.reloadData()
        } catch let erro {
            print(erro.localizedDescription)
        }
    }
    
    func formatDate(date: Any) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = StringsCoreData.dateFormat
        let dateFormat = dateFormatter.string(from: date as! Date)
        return dateFormat
    }
    
    func reSaveCpf() {
        do {
            try self.context.save()
        } catch let erro {
            print(erro.localizedDescription)
        }
    }
    
}
