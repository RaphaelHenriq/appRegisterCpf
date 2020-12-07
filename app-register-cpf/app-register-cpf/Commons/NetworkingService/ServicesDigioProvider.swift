//
//  ServicesDigioProvider.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import Foundation

protocol ServicesDigioProviderDelegate {
    func getServicesDigioData(successCallBack: @escaping (ServicesDigioModel) -> Void, errorCallBack: @escaping (Error) -> Void)
}

class ServicesDigioProvider: ServicesDigioProviderDelegate {
    func getServicesDigioData(successCallBack: @escaping (ServicesDigioModel) -> Void, errorCallBack: @escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet else {
            errorCallBack(ServiceError.noConnection)
            print(ServiceError.noConnection.localizedDescription)
            return
        }

        guard let url = URL(string: URLs.urlDigio) else {
            errorCallBack(ServiceError.invalidURL)
            print(ServiceError.invalidURL.localizedDescription)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                errorCallBack(ServiceError.parsing)
                print(ServiceError.parsing.localizedDescription)
                return
            }

            do {
                let model = try JSONDecoder().decode(ServicesDigioModel.self, from: data)
                print(model)
                successCallBack(model)
            } catch {
                errorCallBack(ServiceError.failure)
                print(ServiceError.failure.localizedDescription)
            }
        }
        .resume()
    }
}
