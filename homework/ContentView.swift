//
//  MainView.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var products = [
        Product(name: "Product 1", price: 10.0, description: "Description of Product 1"),
        Product(name: "Product 2", price: 20.0, description: "Description of Product 2"),
        Product(name: "Product 3", price: 30.0, description: "Description of Product 3")
    ]
    @State private var cart: [Product] = []
    @State private var selectedProduct: Product?
    
    var body: some View {
        TabView {
            NavigationView {
                List(products) { product in
                    ProductCardView(product: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                        .sheet(item: $selectedProduct) { product in
                            ProductDetailView(product: product)
                        }
                }
                .navigationBarTitle("Products")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
                List(cart) { product in
                    HorizontalProductCardView(product: product)
                }
                .navigationBarTitle("Cart")
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Cart")
            }
        }
    }
}

#Preview {
    ContentView()
}
