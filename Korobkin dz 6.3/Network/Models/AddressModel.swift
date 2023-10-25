//
//  AddressModel.swift
//  Korobkin dz 6.3
//
//  Created by Артем Коробкин on 24/10/23.
//

import Foundation
//// MARK: - AddressWelcome
//struct AddressWelcome: Codable {
//    let meta: Meta
//    let result: PostResult
//}
//
//// MARK: - Meta
//struct Meta: Codable {
//    let apiVersion: String
//    let code: Int
//    let issueDate: String
//
//    enum CodingKeys: String, CodingKey {
//        case apiVersion = "api_version"
//        case code
//        case issueDate = "issue_date"
//    }
//}
//
//// MARK: - PostResult
//struct PostResult: Codable {
//    let items: [Item]
//    let total: Int
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let addressName, fullName, id, name: String
//    let point: Point
//    let purposeName, type: String
//
//    enum CodingKeys: String, CodingKey {
//        case addressName = "address_name"
//        case fullName = "full_name"
//        case id, name, point
//        case purposeName = "purpose_name"
//        case type
//    }
//}
//
//// MARK: - Point
//struct Point: Codable {
//    let lat, lon: Double
//}

// MARK: - Welcome
struct Welcome: Codable {
    let main: Main?
    let wind: Wind?
    let name: String?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
}

