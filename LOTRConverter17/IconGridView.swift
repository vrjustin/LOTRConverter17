//
//  IconGridView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/19/24.
//

import SwiftUI

struct IconGridView: View {
    @Binding var selectedCurrency: Currency
        
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
            ForEach(Currency.allCases) {currency in
                if currency == selectedCurrency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        })
    }
}

#Preview {
    IconGridView(selectedCurrency: .constant(.silverPiece))
}
