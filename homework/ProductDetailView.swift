//
//  ProductDetailView.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
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
        }
        .padding()
    }
}

