import SwiftUI

struct ProductDetailView: View {
    var product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(product.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: .infinity)
                         .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, minHeight: 300)
                }
                
                Text("Price: $\(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .padding(.vertical, 10)
                
                Text(product.description)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(product.title, displayMode: .inline)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Tạo dữ liệu mẫu
        let sampleProduct = Product(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9, count: 120))

        ProductDetailView(product: sampleProduct)
    }
}

