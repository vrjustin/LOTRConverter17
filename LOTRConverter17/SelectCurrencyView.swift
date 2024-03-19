//
//  SelectCurrencyView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/19/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var shouldDismiss
    @Binding var topSelectedCurrency: Currency
    @Binding var bottomSelectedCurrency: Currency

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
                IconGridView(selectedCurrency: $topSelectedCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                // Currency Icons
                IconGridView(selectedCurrency: $bottomSelectedCurrency)
                
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
    SelectCurrencyView(topSelectedCurrency: .constant(.copperPenny), bottomSelectedCurrency: .constant(.silverPiece))
}
