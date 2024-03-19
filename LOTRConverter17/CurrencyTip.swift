//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Ruben Movsisyan on 3/18/24.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change currency")
    var message: Text? = Text("You can tpa to left and right currency to bring up the Select Currency screen.")
}
