//
//  RegisterCpfViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import UIKit

class RegisterCpfViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var saveNumberButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    
    // MARK: - Class properties
    
    
    
    
    // MARK: - Init cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBar()
        
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        let tabBarVc = UITabBarController()
        
        let vc1 = FirstViewController()
        let vc2 = ListingCpfViewController()
        
        tabBarVc.setViewControllers([vc1, vc2], animated: false)
        
        tabBarVc.modalPresentationStyle = .fullScreen
        present(tabBarVc, animated: true)
    }
    

}

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
}
