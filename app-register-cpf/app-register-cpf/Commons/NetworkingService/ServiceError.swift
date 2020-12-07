//
//  ServiceError.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import Foundation

public enum ServiceError: Error {
  case parsing
  case failure
  case noConnection
  case invalidURL
  
  var localizedDescription: String {
    switch self {
    case .parsing:
      return "SERVICE ERROR>>> Ocorreu erro de parse do json"
    case .failure:
      return "SERVICE ERROR>>> Ocorreu erro de comunicação com o serviço"
    case .noConnection:
      return "SERVICE ERROR>>> Ocorreu erro de internet"
    case .invalidURL:
      return "SERVICE ERROR>>> Ocorreu erro na criação da URL"
    }
  }
  
  var code: Int {
    switch self {
    case .parsing:
      return 10
    case .failure:
      return 20
    case .noConnection:
      return 30
    case .invalidURL:
      return 40
    }
  }
}
