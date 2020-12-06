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

class RegisterCpfViewModelTest: QuickSpec {

    private var registerCpfViewModel: RegisterCpfViewModel!
    private var textFieldMock: TextFieldMock!
    private var registerCpfViewController: RegisterCpfViewController!
    
    override func spec() {
        describe("DEBUG SESSION/sending events to firebase") {
            beforeEach {
                self.registerCpfViewModel = RegisterCpfViewModel()
                self.textFieldMock = TextFieldMock()
            }
            
            context("test textFieldShouldReturn") {
    
                it("sending less 11 numbers") {
                    let textField = self.textFieldMock.textFieldLessNumbers
                    let tagLimitNumberTextField = self.registerCpfViewModel.textFieldShouldReturn(textField)
                    expect(tagLimitNumberTextField).to(equal(false))
                }
                it("sending 11 numbers") {
                    let textField = self.textFieldMock.textFieldElevenNumbers
                    let tagLimitNumberTextField = self.registerCpfViewModel.textFieldShouldReturn(textField)
                    expect(tagLimitNumberTextField).to(equal(true))
                }
            }
            
            context("test casesTextFieldCpf") {
    
                it("sending save CPF") {
                    let textField = self.textFieldMock.textFieldElevenNumbers
                    let limitNumberTextField = self.registerCpfViewModel.textFieldShouldReturn(textField)
                    let enumStatus = self.registerCpfViewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
                    expect(enumStatus).to(equal(.saveCpf))
                }
                
                it("sending less characters") {
                    
                    let textField = self.textFieldMock.textFieldLessNumbers
                    let limitNumberTextField = self.registerCpfViewModel.textFieldShouldReturn(textField)
                    let enumStatus = self.registerCpfViewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
                    expect(enumStatus).to(equal(.lessCharacters))
                }
                
                it("sending only numbers") {
                    let textField = self.textFieldMock.textFieldOnlyNumbers
                    let limitNumberTextField = self.registerCpfViewModel.textFieldShouldReturn(textField)
                    let enumStatus = self.registerCpfViewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
                    expect(enumStatus).to(equal(.onlyNumbers))
                }
            }
        }
    }
}
