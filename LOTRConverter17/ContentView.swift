//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/16/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency(rawValue: UserDefaults.standard.value(forKey: "leftCurrency") as? Double ?? 16)!
    
    @State var rightCurrency = Currency(rawValue: UserDefaults.standard.value(forKey: "rightCurrency") as? Double ?? 4)!
    
    func removeTextFieldFocus() {
        leftTyping = false
        rightTyping = false
    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    CurrencyConversionView(currency: $leftCurrency,
                                           showSelectCurrency: $showSelectCurrency,
                                           leftAmount: $leftAmount,
                                           isTyping: _leftTyping)
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    CurrencyConversionView(currency: $rightCurrency,
                                           showSelectCurrency: $showSelectCurrency,
                                           leftAmount: $rightAmount,
                                           isTyping: _rightTyping)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                        removeTextFieldFocus()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onTapGesture {
            removeTextFieldFocus()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            UserDefaults.standard.set(rightCurrency.rawValue, forKey: "rightCurrency")
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            UserDefaults.standard.set(leftCurrency.rawValue, forKey: "leftCurrency")
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrecny: $leftCurrency,
                           bottomCurrecny: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
