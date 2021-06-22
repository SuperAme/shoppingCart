//
//  ProductListHelper.swift
//  ShoppingCartAMQ
//
//  Created by IDS Comercial on 22/06/21.
//

import Foundation

class ProductListHelper {
    private let productsJson = """
    [
       {
          "brand_F":"Nike",
          "sneakers_F":[
             {
                "price_F_F":1,
                "name_F":"Nike Court Legacy Canvas",
                "size_F":27,
                "color_F":"white",
                "img_F":"https://i.pinimg.com/236x/46/18/67/46186771f1c43f123206b0659afcbcb3.jpg"
             },
             {
                "id_F":2,
                "name_F":"Nike Blazer Low",
                "size_F":24,
                "color_F":"Orange&Purple",
                "img_F":"https://i.pinimg.com/236x/73/cb/bd/73cbbd14f29ad673879ebe097b669e78.jpg"
             },
             {
                "id_F":3,
                "name_F":"Nike Killshot",
                "size_F":23,
                "color_F":"White&Black",
                "img_F":"https://i.pinimg.com/236x/c9/f5/be/c9f5bef67d20b4bc2a6d99c516567bb4.jpg"
             }
          ]
       },
       {
          "brand_F":"Adidas",
          "sneakers_F":[
             {
                "id_F":1,
                "name_F":"Adidas Runtastic",
                "size_F":24,
                "color_F":"Aqua",
                "img_F":"https://i.pinimg.com/236x/30/ae/d3/30aed3588bfa052a3131047805409e57.jpg"
             },
             {
                "id_F":2,
                "name_F":"Adidas Tenis Stan",
                "size_F":25,
                "color_F":"Yellow",
                "img_F":"https://i.pinimg.com/236x/c5/48/ef/c548efee97b5e4d5be29571f721dc730.jpg"
             },
             {
                "id_F":3,
                "name_F":"Adidad Tenis VS Pace",
                "size_F":26,
                "color_F":"Black",
                "img_F":"https://i.pinimg.com/236x/35/67/a8/3567a8d841b9ceca95052bd70544cfb1.jpg"
             }
          ]
       },
       {
          "brand_F":"Puma",
          "sneakers_F":[
             {
                "id_F":1,
                "name_F":"Tenis Puma Casual Serve",
                "size_F":27,
                "color_F":"Red&Green",
                "img_F":"https://i.pinimg.com/236x/5c/17/9b/5c179b7cbc27a8d232c56debe0be5ef6.jpg"
             },
             {
                "id_F":2,
                "name_F":"Tenis Puma Ralph",
                "size_F":28,
                "color_F":"white",
                "img_F":"https://i.pinimg.com/236x/b5/77/4b/b5774b34580443a89dbc161230b28b87.jpg"
             },
             {
                "id_F":3,
                "name_F":"Tenis Puma Caven",
                "size_F":29,
                "color_F":"blue",
                "img_F":"https://i.pinimg.com/236x/a7/8c/6e/a78c6e767d59ad3f86c8a5ac32235c26.jpg"
             }
          ]
       }
    ]
    """
}
