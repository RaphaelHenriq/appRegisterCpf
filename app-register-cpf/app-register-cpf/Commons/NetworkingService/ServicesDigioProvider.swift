//
//  ServicesDigioProvider.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import Foundation

protocol ServicesDigioProviderDelegate {
    func getServicesDigioData(successCallBack: @escaping () -> Void, errorCallBack: @escaping (Error) -> Void)
}

class ServicesDigioProvider: ServicesDigioProviderDelegate {
    func getServicesDigioData(successCallBack: @escaping () -> Void, errorCallBack: @escaping (Error) -> Void) {
        <#code#>
    }
    
}
