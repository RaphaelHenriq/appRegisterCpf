//
//  Strings.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import Foundation

enum Strings {
    static let numberLabel = "Digite o CPF"
    static let saveNumberButton = "Salvar CPF"
    static let servicesButton = "Serviços Digio"
    static let titleRegisterNavigationBar = "Registre o CPF"
    static let titleListiningNavigationBar = "Listagem CPF"
    static let avoid = ""
    static let okAlertButton = "Ok"
    static let titleRegisterAlertButton = "Falha ao registrar CPF"
    static let messageRegisterAlertButton = "Favor inserir apenas números"
    static let messageLessNumbersRegisterAlertButton = "É necessário inserir 11 números"
}

enum StringsCoreData {
    static let cpfEntity = "Cpf"
    static let textAttribute = "text"
    static let dateAttribute = "date"
}
