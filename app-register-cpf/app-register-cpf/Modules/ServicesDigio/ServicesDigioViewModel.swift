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
    func errorResponse(error: ServiceError)
}

class ServicesDigioViewModel {
    
    // MARK: - Class properties
    
    private var provider: ServicesDigioProvider
    
    // MARK: - Public properties
    
    weak var delegate: ServicesDigioViewModelDelegate?
    var data: ServicesDigioModel?
    var imagesSpotlight: [String] = []
    var imagesProduct: [String] = []
    var digioCash: Cash?
    var spotlight: [Spotlight] = []
    var product: [Product] = []
    
    // MARK: - Init methods
    
    init(provider: ServicesDigioProvider) {
        self.provider = provider
    }
    
    // MARK: - Class methods
    
    private func refresContent(data: ServicesDigioModel) {
        self.data = data
        self.imagesSpotlight = data.spotlight?.compactMap({ $0.bannerURL }) ?? []
        self.spotlight = data.spotlight ?? []
        self.digioCash = data.cash
        self.imagesProduct = data.products?.compactMap({ $0.imageURL }) ?? []
        self.product = data.products ?? []
    }
    
    // MARK: - Public methods
    
    func fetchData() {
        self.provider.getServicesDigioData(successCallBack: {[weak self] (data) in
            self?.refresContent(data: data)
            self?.delegate?.successResponse()
        }) {[weak self] (error) in
            self?.delegate?.errorResponse(error: error as! ServiceError)
        }
    }
    
    func refreshData() -> () {
        self.fetchData()
    }
}
