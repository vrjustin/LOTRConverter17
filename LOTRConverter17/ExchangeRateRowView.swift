//
//  ExchangeRateRowView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/19/24.
//

import SwiftUI

struct ExchangeRateRowView: View {
    
    let leftImage: ImageResource
    let rateText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            //Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange Rate Text
            Text(rateText)
            
            // Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRateRowView(leftImage: .goldpiece, rateText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
