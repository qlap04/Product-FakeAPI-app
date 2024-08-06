//
//  ContentView.swift
//  ProductsFakeAPI
//
//  Created by Phan Quốc Lập on 07/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductViewModel()

    var body: some View {
        CategoryView()
    }
}

#Preview {
    ContentView()
}
