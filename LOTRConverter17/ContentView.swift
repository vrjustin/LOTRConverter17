//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrencyView = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    @FocusState var leftTyping
    @FocusState var rightTyping
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrencyView.toggle()
                        }
                        
                        //Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
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
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrencyView.toggle()
                        }
                        
                        //Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            
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
        .onChange(of: leftAmount, {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        })
        .onChange(of: rightAmount, {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        })
        .onChange(of: leftCurrency, {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        })
        .onChange(of: rightCurrency, {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        })
        .sheet(isPresented: $showExchangeInfo, content: {
            ExchangeInfoView()
        })
        .sheet(isPresented: $showSelectCurrencyView, content: {
            SelectCurrencyView(topSelectedCurrency: $leftCurrency, bottomSelectedCurrency: $rightCurrency)
        })
    }
}

#Preview {
    ContentView()
}
