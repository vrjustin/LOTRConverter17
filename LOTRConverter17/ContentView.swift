//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    var body: some View {
        ZStack {
            //Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Prancing Pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency Conversion Text
                HStack {
                    // Left Conversion
                    VStack {
                        //Currency
                        HStack {
                            // Currency Image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        //Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                    // Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion
                    VStack {
                        //Currency
                        HStack {
                            // Currency Text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Currency Image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        
                        //Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }

            }
//            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
