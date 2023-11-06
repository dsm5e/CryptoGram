//
//  Data + Ext.swift
//  CryptoGram
//
//  Created by dsm 5e on 02.11.2023.
//

import Foundation

extension Date {
    
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormattter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = .init(identifier: "en")
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormattter.string(from: self)
    }
}
