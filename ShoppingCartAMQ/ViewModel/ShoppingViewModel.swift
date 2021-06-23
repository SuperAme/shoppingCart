//
//  ShoppingViewModel.swift
//  ShoppingCartAMQ
//
//  Created by IDS Comercial on 22/06/21.
//

import Foundation

class ShoppingViewModel {
    var productsData = ProductListHelper().getProductsData()
    var sneakersArray = [Sneaker]()
    
    func getTotalOfSneakers() -> [Sneaker]? {
        for product in productsData {
            sneakersArray.append(contentsOf: product.sneakers)
        }
        return sneakersArray
    }
    
}
