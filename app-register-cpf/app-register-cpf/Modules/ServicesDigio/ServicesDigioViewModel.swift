//
//  ServicesDigioViewModel.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import Foundation
import UIKit

protocol ServicesDigioViewModelDelegate: NSObject {
    func successResponse()
    func errorResponse()
}

class ServicesDigioViewModel {
    
    // MARK: - Class properties
    
    private var provider: ServicesDigioProvider
    
    // MARK: - Public properties
    
    weak var delegate: ServicesDigioViewModelDelegate?
    
    // MARK: - Init methods
    
    init(provider: ServicesDigioProvider) {
        self.provider = provider
    }
    
    // MARK: - nClass methods
    
    private func refresContent() {
        
    }
    
    // MARK: - Public methods
    
    func fetchData() {
        
    }
}
