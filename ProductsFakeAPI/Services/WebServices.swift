//
//  WebServices.swift
//  ProductsFakeAPI
//
//  Created by Phan Quốc Lập on 07/07/2024.
// https://fakestoreapi.com/products

import Foundation
enum ErrorNetwork : Error{
    case badURL
    case badRequest
    case decodingError
}
class WebServices{
    func getProducts() async throws -> [Product]{
        guard let baseURL = URL(string: "http://127.0.0.1:8080/products") else{
            throw ErrorNetwork.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw ErrorNetwork.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else{
            throw ErrorNetwork.decodingError
        }
        return products
    }
}
