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
    
    private func saveCpf(textField: UITextField) {
        let newCpf = NSEntityDescription.insertNewObject(forEntityName: StringsCoreData.cpfEntity, into: self.context)
        
        newCpf.setValue(textField.text, forKey: StringsCoreData.textAttribute)
        newCpf.setValue(NSDate(), forKey: StringsCoreData.dateAttribute)
        
        do {
            try self.context.save()
        } catch let erro {
            print(erro.localizedDescription)
        }
    }
    
    // MARK: - Public methods
    
    func casesTextFieldCpf(limitAcceptedTextView: Bool, textField: UITextField) -> textFieldCpf {
        
        if (String(textField.text ?? StringsAlerts.avoid).isInt) {
            if limitAcceptedTextView {
                self.saveCpf(textField: textField)
                return .saveCpf
                
            } else {
                return .lessCharacters
            }
            
        } else {
            return .onlyNumbers
        }
        
    }
    
    func coreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
    
}
