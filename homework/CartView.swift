//
//  CartView.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import SwiftUI

struct CartView: View {
    @Binding var cart: [Product]
    @State private var isCheckingOut = false
    @State private var showValidationLoader = false
    
    var totalCost: Double {
        cart.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }
    
    var body: some View {
        VStack {
            if totalCost < 8000 {
                Text("Add \(8000 - totalCost, specifier: "%.2f") KZT for free shipping")
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            List {
                ForEach(cart) { product in
                    HorizontalProductCardView(product: product)
                }
            }
            
            HStack {
                Text("Total: \(totalCost, specifier: "%.2f") KZT")
                    .font(.title)
                Spacer()
                Button(action: {
                    showValidationLoader = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showValidationLoader = false
                        isCheckingOut = true
                    }
                }) {
                    Text("Checkout")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            if showValidationLoader {
                ProgressView("Validating cart...")
                    .padding()
            }
        }
        .sheet(isPresented: $isCheckingOut) {
            Text("Hello World!")
                .font(.largeTitle)
        }
        .navigationBarTitle("Cart")
    }
}
