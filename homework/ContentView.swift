//
//  MainView.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var products = [
        Product(name: "Product 1", price: 1000.0, description: "Description of Product 1"),
        Product(name: "Product 2", price: 2000.0, description: "Description of Product 2"),
        Product(name: "Product 3", price: 3000.0, description: "Description of Product 3")
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
                            ProductDetailView(product: product, cart: $cart)
                        }
                }
                .navigationBarTitle("Products")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
                CartView(cart: $cart)
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
