//
//  SelectCurrencyView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/19/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var shouldDismiss
    @State var selectedCurrency: Currency

    var body: some View {
        ZStack {
            // Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency Icons
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
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                // Currency Icons
                
                // Done Button
                Button("Done") {
                    shouldDismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrencyView(selectedCurrency: .silverPiece)
}
