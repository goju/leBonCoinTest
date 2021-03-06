//
//  APIResult.swift
//  leBonCoinTest
//
//  Created by julien brandin on 22/04/2021.
//  Copyright © 2021 julien brandin. All rights reserved.
//

import Foundation
import UIKit

struct category: Decodable {
    var id: Int
    var name: String
}

struct advert: Decodable {
    var id: Int
    var categoryId: Int
    var title: String
    var description: String
    var price: Int
    var imagesUrl: imageUrl
    var creationDate: Date
    var isUrgent: Bool
    var siret: String?
    
    public init(id: Int,
                   categoryId: Int,
                   title: String,
                   description: String,
                   price: Int,
                   imagesUrl: imageUrl,
                   creationDate: Date,
                   isUrgent: Bool,
                   siret: String?) {
           self.id = id
           self.categoryId = categoryId
           self.title = title
           self.description = description
           self.price = price
           self.imagesUrl = imagesUrl
           self.creationDate = creationDate
           self.isUrgent = isUrgent
           self.siret = siret
       }

       // Coding Keys
       enum CodingKeys : String, CodingKey {
            case id
            case categoryId = "category_id"
            case title
            case description
            case price
            case imagesUrl = "images_url"
            case creationDate = "creation_date"
            case isUrgent = "is_urgent"
            case siret
    }
    
    

    /// Init for  decoding optionals
       public init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           id = try values.decode(Int.self, forKey: .id)
           categoryId = try values.decode(Int.self, forKey: .categoryId)
           title = try values.decode(String.self, forKey: .title)
           description = try values.decode(String.self, forKey: .description)
           price = try values.decode(Int.self, forKey: .price)
           imagesUrl = try values.decode(imageUrl.self, forKey: .imagesUrl)
           creationDate = try values.decode(Date.self, forKey: .creationDate)
           isUrgent = try values.decode(Bool.self, forKey: .isUrgent)
           siret = try? values.decode(String.self, forKey: .siret)
       }
    
}


public struct imageUrl: Decodable {
    var small: URL?
    var thumb: URL?
    
    public init(small: String,
                thumb: String){
        self.small = URL(string: small)
        self.thumb = URL(string: thumb)
    }
    
    enum CodingKeys : String, CodingKey {
        case small
        case thumb
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        small = try? values.decode(URL.self, forKey: .small)
        thumb = try? values.decode(URL.self, forKey: .thumb)
    }
    
}
