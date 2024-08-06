//
//  ProductViewModel.swift
//  ProductsFakeAPI
//
//  Created by Phan Quốc Lập on 07/07/2024.
//

import Foundation
@MainActor
class ProductViewModel : ObservableObject{
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let webService = WebServices()
    
    func fetchProducts() {
        Task {
            do {
                isLoading = true
                errorMessage = nil
                let products = try await webService.getProducts()
                self.products = products
                isLoading = false
            } catch {
                self.errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }
}
