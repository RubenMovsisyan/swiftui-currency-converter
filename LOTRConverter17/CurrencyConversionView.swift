//
//  CurrencyConversionView.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/19/24.
//

import SwiftUI

struct CurrencyConversionView: View {
    @Binding var currency: Currency
    @Binding var showSelectCurrency: Bool
    @Binding var leftAmount: String
    @FocusState var isTyping
    
    var body: some View {
        VStack {
            HStack {
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
                isTyping = false
            }
            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
            
            TextField( "Amount", text: $leftAmount)
                .textFieldStyle(.roundedBorder)
                .focused($isTyping)
                .keyboardType(.decimalPad)
         }
    }
}

#Preview {
    CurrencyConversionView(currency: .constant(.copperPenny), showSelectCurrency: .constant(true), leftAmount: .constant(""))
}
