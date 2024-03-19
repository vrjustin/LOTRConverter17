//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Justin Maronde on 3/19/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    var message: Text? = Text("Tap left or right currency to bring up the Select Currency screen.")
}
