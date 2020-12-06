//
//  TextFieldMock.swift
//  app-register-cpfTests
//
//  Created by Raphael Henrique on 12/6/20.
//

import Foundation
import XCTest

@testable import app_register_cpf

class TextFieldMock {
    let textFieldSaveCpf = "45585935895"
    let textFieldOnlyNumbers = "1daD.@-"
    let textFieldLessNumbers = "4558"
    private var tagTextField: Bool = true
    
    func textFieldShouldReturn(_ textField: String) -> Bool {
        if textField.count < 11 {
            self.tagTextField = false
        } else if textField.count == 11 {
            self.tagTextField = true
        }
        return self.tagTextField
    }
}
