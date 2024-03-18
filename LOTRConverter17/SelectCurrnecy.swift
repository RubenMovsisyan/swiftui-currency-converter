//
//  SelectCurrnecy.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/17/24.
//

import SwiftUI

struct SelectCurrnecy: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                . ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(0..<5) { _ in
                        
                    }
//                    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold piece")
//                    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold penny")
//                    CurrencyIcon(currencyImage: .silverpiece, currencyName: "Silver piece")
//                    CurrencyIcon(currencyImage: .silverpenny, currencyName: "Silver penny")
//                    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper penny")
                }

                
                Text("Select the currency you wpould like to convert to:")
                    .fontWeight(.bold)
                
                Button("Done") {
                    dismiss()
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
    SelectCurrnecy()
}
