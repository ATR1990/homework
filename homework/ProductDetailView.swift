//
//  ProductDetailView.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @Binding var cart: [Product]
    
    var body: some View {
        VStack {
            Text(product.name)
                .font(.largeTitle)
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title)
            Text(product.description)
                .font(.body)
                .padding()
            Spacer()
            Button(action: {
                if let index = cart.firstIndex(where: { $0.id == product.id }) {
                    cart[index].quantity += 1
                } else {
                    var newProduct = product
                    newProduct.quantity = 1
                    cart.append(newProduct)
                }
            }) {
                Text("Add to Cart")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

