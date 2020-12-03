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
    
    private var context: NSManagedObjectContext!
    
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
        } catch let erro as Error {
            print(erro.localizedDescription)
        }
    }
    
}
