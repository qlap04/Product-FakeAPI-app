import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    VStack {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(1.5)
                        Text("Please wait while we fetch the products.")
                            .padding(.top, 10)
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                        Text(errorMessage)
                            .font(.headline)
                            .padding()
                        Button(action: {
                            viewModel.fetchProducts()
                        }) {
                            Text("Retry")
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                } else {
                    List {
                        ForEach(Array(Set(viewModel.products.map { $0.category })), id: \.self) { category in
                            NavigationLink(destination: ProductListView(category: category, products: viewModel.products)) {
                                HStack {
                                    Image(systemName: "tag.fill")
                                        .foregroundColor(.blue)
                                    Text(category.capitalized)
                                        .font(.headline)
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationBarTitle("Categories", displayMode: .inline)
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

