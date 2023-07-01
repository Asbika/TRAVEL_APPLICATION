//
//  VilleStructure.swift
//  NewVille
//
//  Created by Asbika Hicham on 6/3/23.
//

import Foundation

struct Ville{
    var image: String
    var city : String
    var country : String
    var description : String
    
    init(image: String, city : String,country : String,description : String) {
        self.image = image
        self.city = city
        self.country = country
        self.description = description
    }
}
