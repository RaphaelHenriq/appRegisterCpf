//
//  BaseViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/3/20.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    // MARK: - Class properties
    
    private var enumIdInfo: idInformation?
    
    // MARK: - Class methods
    
    @objc
    private func openInfoModule() {
        switch self.enumIdInfo {
        case .registerVC:
            let vc = InformationViewController(enumIdInfo: .registerVC)
            self.modalVC(vc)
        case .listingVC:
            let vc = InformationViewController(enumIdInfo: .listingVC)
            self.modalVC(vc)
        case .none:
            break
        }
    }
    
    // MARK: - Public methods
    
    func configureRightButtonNavigationBar(enumIdInformation: idInformation) {
        let imageInfo = UIImage(named: "InformationListing")?.withRenderingMode(.alwaysTemplate)
        
        self.enumIdInfo = enumIdInformation
        let infoButton = UIBarButtonItem(image: imageInfo, style: .plain, target: self, action: #selector(openInfoModule))
          
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.7294117647, blue: 0, alpha: 1)
        self.navigationItem.rightBarButtonItem = infoButton
    }
}

