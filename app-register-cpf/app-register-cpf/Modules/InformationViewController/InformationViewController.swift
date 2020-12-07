//
//  InformationViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import UIKit

class InformationViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionFirstLabel: UILabel!
    @IBOutlet weak var descriptionSecondLabel: UILabel!
    
    // MARK: - Class properties
    
    private var enumIdInfo: IdInformation?
    
    // MARK: - Init cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.configureLabels()
    }
    
    init(enumIdInfo: IdInformation) {
        self.enumIdInfo = enumIdInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class methods
    
    private func configureLabels() {
        self.titleLabel.text = StringsInformationVC.titleInformationLabel
        
        switch self.enumIdInfo {
        case .registerVC:
            self.descriptionSecondLabel.isHidden = false
            self.descriptionFirstLabel.text = StringsInformationVC.descriptionInformationSaveCpfLabel
            self.descriptionSecondLabel.text = StringsInformationVC.descriptionInformationServicesLabel
            self.topImageView.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
            
        case .listingVC:
            self.descriptionSecondLabel.isHidden = true
            self.descriptionFirstLabel.text = StringsInformationVC.descriptionInformationDeleteLabel
            self.topImageView.image = UIImage(systemName: "tray.full.fill")
        case .none:
            break
        }
    }
}
