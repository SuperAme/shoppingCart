//
//  Product.swift
//  ShoppingCartAMQ
//
//  Created by IDS Comercial on 22/06/21.
//

import Foundation

struct Product: Codable {
    var brand: String
    var sneakers: [Sneaker]
    
    enum CodingKeys: String, CodingKey {
        case brand = "brand_F"
        case sneakers = "sneakers_F"
    }
}

struct Sneaker: Codable {
    var price: Double
    var name: String
    var size: Int
    var color: String
    var img: String
    
    enum CodingKeys: String, CodingKey {
        case price = "price_F"
        case name = "name_F"
        case size = "size_F"
        case color = "color_F"
        case img = "img_F"
    }
}
