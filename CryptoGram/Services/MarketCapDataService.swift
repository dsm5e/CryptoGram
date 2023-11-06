//
//  MarketCapDataService.swift
//  CryptoGram
//
//  Created by dsm 5e on 20.09.2023.
//

import Foundation

import Foundation
import Combine

class MarketCapDataService {
    
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedData) in
                self?.marketData = returnedData.data
                print("Забрали данные marketCap")
                self?.marketDataSubscription?.cancel()
            })
    }
}
