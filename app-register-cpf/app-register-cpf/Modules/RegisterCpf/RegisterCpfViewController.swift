//
//  RegisterCpfViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import UIKit

class RegisterCpfViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var saveNumberButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    
    // MARK: - Class properties
    
    private let viewModel: RegisterCpfViewModel
    
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
    }
    
    // MARK: - Class methods
    
    private func configureContent() {
        self.numberLabel.text = Strings.numberLabel
        self.servicesButton.setTitle(Strings.servicesButton, for: .normal)
        self.saveNumberButton.setTitle(Strings.saveNumberButton, for: .normal)
    }
    
    private func layoutViewController() {
        self.view.backgroundColor = .white
        self.saveNumberButton.backgroundColor = .systemGray
        self.saveNumberButton.allCorner(cornerRadius: 10)
        self.servicesButton.backgroundColor = .systemBlue
        self.servicesButton.allCorner(cornerRadius: 10)
        self.numberTextField.delegate = self
    }
    
    // MARK: - Public methods

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 11
    }

    // MARK: - Actions
    
    @IBAction func servicesTapButton(_ sender: Any) {
        print("Click Services")
    }
    
    @IBAction func saveTapButton(_ sender: Any) {
        if (String(self.numberTextField.text ?? "").isInt) {
            self.viewModel.saveCpf(textField: numberTextField)
            self.numberTextField.text = Strings.avoidRegisterCpf
        } else {
            self.showAlertCommon(title: Strings.titleRegisterAlertButton, message: Strings.messageRegisterAlertButton, handler: nil)
            self.numberTextField.text = Strings.avoidRegisterCpf
        }

    }
    
}
