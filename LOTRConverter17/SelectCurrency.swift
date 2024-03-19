//
//  SelectCurrnecy.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/17/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrecny: Currency
    @Binding var bottomCurrecny: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                . ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                IconGrid(currency: $topCurrecny)
                
                Text("Select the currency you wpould like to convert to:")
                    .fontWeight(.bold)
                
                IconGrid(currency: $bottomCurrecny)
                
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
    SelectCurrency(topCurrecny: .constant(.copperPenny),
                   bottomCurrecny: .constant(.silverPiece))
}
