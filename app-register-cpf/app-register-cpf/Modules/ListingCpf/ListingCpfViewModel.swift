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
    
    // MARK: - Public properties
    
    var context: NSManagedObjectContext!
    var Cpf: [NSManagedObject] = []
    
    // MARK: - Class methods
    
    func coreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
    }

    func getCpf(reloadTableView: UITableView) {
        let requisition = NSFetchRequest<NSFetchRequestResult>(entityName: "Cpf")
        do {
            let requisitionGet = try context.fetch(requisition)
            guard let cpf = requisitionGet as? [NSManagedObject] else { return }
            self.Cpf = cpf
            reloadTableView.reloadData()
        } catch let erro {
            print(erro.localizedDescription)
        }
    }
    
    func formatDate(date: Any) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = StringsCoreData.dateFormat
        let dateFormat = dateFormatter.string(for: date)
        return dateFormat ?? StringsAlerts.avoid
    }
    
    func reSaveCpf() {
        do {
            try self.context.save()
        } catch let erro {
            print(erro.localizedDescription)
        }
    }
    
}
