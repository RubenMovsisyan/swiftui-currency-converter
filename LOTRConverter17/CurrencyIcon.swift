//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/17/24.
//

import SwiftUI

struct CurrencyIcon: View {
    var currencyImage: ImageResource
    var currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper penny")
}
