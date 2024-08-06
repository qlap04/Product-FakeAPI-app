import SwiftUI

struct ProductListView: View {
    let category: String
    let products: [Product]

    var filteredProducts: [Product] {
        products.filter { $0.category == category }
    }

    var body: some View {
        List(filteredProducts) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                HStack {
                    AsyncImage(url: URL(string: product.image)) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 50, height: 50)
                             .cornerRadius(5)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .navigationBarTitle(category.capitalized, displayMode: .inline)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        // Tạo dữ liệu mẫu
        let sampleProducts = [
            Product(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9, count: 120)),
            Product(id: 2, title: "Mens Casual Premium Slim Fit T-Shirts", price: 22.3, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", category: "men's clothing", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: Rating(rate: 4.1, count: 259))
        ]

        ProductListView(category: "men's clothing", products: sampleProducts)
    }
}

