//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/16/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            
            Text(text)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece,
                 text: "1 Silver Piece = 4 Silver Pennies",
                 rightImage: .silverpenny)
}

