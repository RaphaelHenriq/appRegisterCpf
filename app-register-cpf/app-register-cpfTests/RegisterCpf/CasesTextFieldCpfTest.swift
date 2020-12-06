//
//  CasesTextFieldCpfTest.swift
//  app-register-cpfTests
//
//  Created by Raphael Henrique on 12/6/20.
//

import XCTest
import Quick
import Nimble

@testable import app_register_cpf

class CasesTextFieldCpfTest: QuickSpec {

    private var registerCpfViewModel: RegisterCpfViewModel!
    private var textFieldMock: TextFieldMock!
    
    override func spec() {
        describe("DEBUG SESSION/sending events to firebase") {
            beforeEach {
                self.registerCpfViewModel = RegisterCpfViewModel()
                self.textFieldMock = TextFieldMock()
            }
            
            context("status textField") {
    
                it("sending save CPF") {
                    let textField = self.textFieldMock.textFieldSaveCpf
                    let limitNumberTextField = self.textFieldMock.textFieldShouldReturn(textField)
                    let enumStatus = self.registerCpfViewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
                    expect(enumStatus).to(equal(.saveCpf))
                }
                
                it("sending less characters") {
                    
                    let textField = self.textFieldMock.textFieldLessNumbers
                    let limitNumberTextField = self.textFieldMock.textFieldShouldReturn(textField)
            
                    let enumStatus = self.registerCpfViewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
                    expect(enumStatus).to(equal(.lessCharacters))
                }
                
                it("sending only numbers") {
                    let textField = self.textFieldMock.textFieldOnlyNumbers
                    let limitNumberTextField = self.textFieldMock.textFieldShouldReturn(textField)
                    let enumStatus = self.registerCpfViewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
                    expect(enumStatus).to(equal(.onlyNumbers))
                }
            }
        }
    }
}
