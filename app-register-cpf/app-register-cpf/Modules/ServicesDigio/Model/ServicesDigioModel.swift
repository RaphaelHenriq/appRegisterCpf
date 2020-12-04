//
//  ServicesDigioModel.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import Foundation

// MARK: - HomeModel

struct ServicesDigioModel: Codable {
    var spotlight: [Spotlight]?
    var products: [Product]?
    var cash: Cash?
}

// MARK: - Cash

struct Cash: Codable {
    var title: String?
    var bannerURL: String?
    var cashDescription: String?

    enum CodingKeys: String, CodingKey {
        case title, bannerURL
        case cashDescription = "description"
    }
}

// MARK: - Product

struct Product: Codable {
    var name: String?
    var imageURL: String?
    var productDescription: String?

    enum CodingKeys: String, CodingKey {
        case name, imageURL
        case productDescription = "description"
    }
}

// MARK: - Spotlight

struct Spotlight: Codable {
    var name: String?
    var bannerURL: String?
    var spotlightDescription: String?

    enum CodingKeys: String, CodingKey {
        case name, bannerURL
        case spotlightDescription = "description"
    }
}
