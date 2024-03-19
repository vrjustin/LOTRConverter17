//
//  ExchangeInfoView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/18/24.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var shouldDismiss
    
    var body: some View {
        ZStack {
            //Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // Description Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Exchange Rates
                ExchangeRateRowView(leftImage: .goldpiece, rateText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)

                ExchangeRateRowView(leftImage: .goldpenny, rateText: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)

                ExchangeRateRowView(leftImage: .silverpiece, rateText: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)

                ExchangeRateRowView(leftImage: .silverpenny, rateText: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)

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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}
