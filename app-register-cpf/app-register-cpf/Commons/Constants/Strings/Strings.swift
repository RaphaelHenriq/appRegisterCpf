//
//  Strings.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import Foundation

enum StringsNavigationBar {
    static let titleRegisterNavigationBar = "Registre o CPF"
    static let titleListiningNavigationBar = "Listagem CPF"
}

enum StringsRegisterVC {
    static let numberLabel = "Digite o CPF"
    static let saveNumberButton = "Salvar CPF"
    static let servicesButton = "Serviços Digio"
}

enum StringsAlerts {
    static let avoid = ""
    static let okAlertButton = "Ok"
    static let titleAlertFailureRegister = "Falha ao registrar CPF"
    static let messageAlertInsertOnlyNumbers = "Favor inserir apenas números"
    static let messageAlertLessNumbers = "É necessário inserir 11 números"
    static let titleSucessRegister = "Sucesso ao registrar CPF"
    static let messageAlertFailureRegister = "Ocrreu algum problema no registro do CPF"
}

enum StringsServicesDigioVC {
    static let labelDigio = "digio"
    static let labelCash = "Cash"
    static let labelProduct = "Produtos"
}

enum StringsListiningVC {
    static let textListingCpf = "CPF: "
    static let textListingDate = "Data: "
}

enum StringsInformationVC {
    static let titleInformationLabel = "Dicas de Uso:"
    static let descriptionInformationSaveCpfLabel = " - Para salvar um CPF, insira apenas 11 números e pressione em salvar."
    static let descriptionInformationServicesLabel = " - Para conhecer serviços da Digio, pressione o botão Serviços Digio."
    static let descriptionInformationDeleteLabel = " - Para apagar um CPF, deslize para a esquerda."
}

enum StringsCoreData {
    static let cpfEntity = "Cpf"
    static let textAttribute = "text"
    static let dateAttribute = "date"
    static let dateFormat = "dd/MM/yyyy - hh:mm:ss"
}
