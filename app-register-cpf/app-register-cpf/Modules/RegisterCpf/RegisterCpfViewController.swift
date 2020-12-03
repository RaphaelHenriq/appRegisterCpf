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
    
    
    
    // MARK: - Init cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureContent()
        self.rulesTextView()
        self.layoutViewController()
    }
    
    // MARK: - Class methods
    
    private func configureContent() {
        self.numberLabel.text = Strings.numberLabel
        self.servicesButton.setTitle(Strings.servicesButton, for: .normal)
        self.saveNumberButton.setTitle(Strings.saveNumberButton, for: .normal)
    }
    
    private func rulesTextView() {
        self.numberTextField.keyboardType = .numberPad
    }
    
    private func layoutViewController() {
        self.view.backgroundColor = .white
        self.saveNumberButton.backgroundColor = .systemGray
        self.saveNumberButton.allCorner(cornerRadius: 10)
        self.servicesButton.backgroundColor = .systemBlue
        self.servicesButton.allCorner(cornerRadius: 10)
        
        self.numberTextField.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func servicesTapButton(_ sender: Any) {
        print("Click Services")
    }
    
    @IBAction func saveTapButton(_ sender: Any) {
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
}
