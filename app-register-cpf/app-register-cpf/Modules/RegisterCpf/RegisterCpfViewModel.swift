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
    
    // MARK: - Public methods
    
    func saveCpf(textField: String) {
        let newCpf = NSEntityDescription.insertNewObject(forEntityName: StringsCoreData.cpfEntity, into: self.context)
        
        newCpf.setValue(textField, forKey: StringsCoreData.textAttribute)
        newCpf.setValue(NSDate(), forKey: StringsCoreData.dateAttribute)
        
        do {
            try self.context.save()
        } catch let erro {
            print(erro.localizedDescription)
        }
    }
    
    func coreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func casesTextFieldCpf(limitAcceptedTextView: Bool, textField: String) -> TextFieldCpf {
        if (String(textField).isInt) {
            if limitAcceptedTextView {
                return .saveCpf
                
            } else {
                return .lessCharacters
            }
            
        } else {
            return .onlyNumbers
        }
    }
    
    func textFieldShouldReturn(_ textField: String) -> Bool {
        if textField.count == 11 {
            return true
        } else {
            return false
        }
    }
}
