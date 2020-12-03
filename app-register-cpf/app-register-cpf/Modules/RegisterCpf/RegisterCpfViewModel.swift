//
//  RegisterCpfViewModel.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import Foundation
import UIKit
import CoreData

class RegisterCpfViewModel {
    
    // MARK: - Class properties
    
    private var context: NSManagedObjectContext!
    
    // MARK: - Class methods
    
    func coreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        
    }

    func saveCpf(textField: UITextField) {
        let newCpf = NSEntityDescription.insertNewObject(forEntityName: "Cpf", into: self.context)
        
        newCpf.setValue(textField.text, forKey: "text")
        newCpf.setValue(Date(), forKey: "date")
        
        do {
            try self.context.save()
            print("Sucesso ao salvar anotação")
            print(textField.text)
        } catch let erro as Error {
            print(erro.localizedDescription)
        }
    }
    
}
