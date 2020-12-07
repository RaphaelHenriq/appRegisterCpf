//
//  RegisterCpfViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import UIKit

class RegisterCpfViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var saveNumberButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    
    // MARK: - Class properties
    
    private let viewModel: RegisterCpfViewModel
    private let enumIdInformation: IdInformation = .registerVC
    
    // MARK: - Init cycle
    
    init() {
        self.viewModel = RegisterCpfViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContent()
        self.layoutViewController()
        self.viewModel.coreData()
        self.numberTextField.delegate = self
        self.configureRightButtonNavigationBar(enumIdInformation: self.enumIdInformation)
    }
    
    // MARK: - Class methods
    
    private func configureContent() {
        self.hideKeyboardWhenTappedAround()
        self.numberLabel.text = StringsRegisterVC.numberLabel
        self.servicesButton.setTitle(StringsRegisterVC.servicesButton, for: .normal)
        self.saveNumberButton.setTitle(StringsRegisterVC.saveNumberButton, for: .normal)
    }
    
    private func layoutViewController() {
        self.view.backgroundColor = .systemGray5
        self.saveNumberButton.backgroundColor = .systemBlue
        self.saveNumberButton.allCorner(cornerRadius: 10)
        self.servicesButton.backgroundColor = .systemBlue
        self.servicesButton.allCorner(cornerRadius: 10)
        self.numberTextField.delegate = self
    }
    
    private func statusTextFieldWhenTapSave() {
        if let textField = self.numberTextField.text {
            let limitNumberTextField = self.viewModel.textFieldShouldReturn(textField)
            let enumTextField = self.viewModel.casesTextFieldCpf(limitAcceptedTextView: limitNumberTextField, textField: textField)
            switch enumTextField {
            case .saveCpf:
                self.viewModel.saveCpf(textField: textField)
                self.showAlertCommon(title: StringsAlerts.titleSucessRegister, message: nil, buttonOk: StringsAlerts.okAlertButton, buttonCancel: false, handler: nil)
                self.numberTextField.text = StringsAlerts.avoid
                
            case .lessCharacters:
                self.showAlertCommon(title: StringsAlerts.titleAlertFailureRegister, message: StringsAlerts.messageAlertLessNumbers, buttonOk: StringsAlerts.okAlertButton, buttonCancel: false, handler: nil)
                
            case .onlyNumbers:
                self.showAlertCommon(title: StringsAlerts.titleAlertFailureRegister, message: StringsAlerts.messageAlertInsertOnlyNumbers, buttonOk: StringsAlerts.okAlertButton, buttonCancel: false, handler: nil)
                self.numberTextField.text = StringsAlerts.avoid
            }
        }
    }

    // MARK: - Actions
    
    @IBAction func servicesTapButton(_ sender: Any) {
        let vc = ServicesDigioViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func saveTapButton(_ sender: Any) {
        self.statusTextFieldWhenTapSave()
    }
}

// MARK: - Extensions

extension RegisterCpfViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 11
    }
}
