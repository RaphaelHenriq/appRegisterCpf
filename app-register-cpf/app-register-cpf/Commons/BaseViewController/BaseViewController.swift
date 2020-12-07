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
    
    private var enumIdInfo: IdInformation?
    
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
    
    func configureRightButtonNavigationBar(enumIdInformation: IdInformation) {
        let imageInfo = UIImage(systemName: "info.circle.fill")?.withRenderingMode(.alwaysTemplate)
        
        self.enumIdInfo = enumIdInformation
        let infoButton = UIBarButtonItem(image: imageInfo, style: .plain, target: self, action: #selector(openInfoModule))
          
        self.navigationItem.rightBarButtonItem = infoButton
    }
}
