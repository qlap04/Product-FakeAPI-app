//
//  Product.swift
//  ProductsFakeAPI
//
//  Created by Phan Quốc Lập on 07/07/2024.
//

import Foundation

struct Product: Identifiable, Decodable{
    let id : Int
    let title: String
    let price: Double
    var getPrice : String{
        return String(format: "%.1f", price)
    }
    
    let description : String
    let category: String
    let image : String
    let rating : Rating
}
struct Rating : Decodable{
    let rate : Double
    let count : Int
}
