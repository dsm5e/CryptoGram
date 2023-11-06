//
//  MarketDataModel.swift
//  CryptoGram
//
//  Created by dsm 5e on 19.09.2023.
//

import Foundation

// JSON DATA:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON RESPONSE:
 
 {
 "data":{
 "active_cryptocurrencies":10046,
 "upcoming_icos":0,
 "ongoing_icos":49,
 "ended_icos":3376,
 "markets":865,
 "total_market_cap":{
 "btc":41088717.961809896,
 "eth":680075617.1638461,
 "ltc":16580745025.590136,
 "bch":5116664930.004554,
 "bnb":5147345291.318606,
 "eos":1919015168999.1526,
 "xrp":2176997903759.9858,
 "xlm":9489850243599.484,
 "link":164177086293.86746,
 "dot":269748163619.99,
 "yfi":205104720.22122338,
 "usd":1116726177979.068,
 "aed":4101601244575.763,
 "ars":390855502364087.7,
 "aud":1730161735161.8176,
 "bdt":122570267259821.83,
 "bhd":420948816063.0325,
 "bmd":1116726177979.068,
 "brl":5439014849847.073,
 "cad":1501299872246.7893,
 "chf":1002585595327.8291,
 "clp":987576795495789.0,
 "cny":8149085938566.643,
 "czk":25588815516972.582,
 "dkk":7794637049676.1045,
 "eur":1045726961035.5146,
 "gbp":901173457653.1915,
 "hkd":8734082946901.01,
 "huf":401319769380673.7,
 "idr":1.718222815593045e+16,
 "ils":4254620649113.3564,
 "inr":92997708662371.2,
 "jpy":165112432318917.2,
 "krw":1483823608971468.5,
 "kwd":344757939118.054,
 "lkr":361709603520374.1,
 "mmk":2.345257811685093e+15,
 "mxn":19072622230013.426,
 "myr":5244704494878.683,
 "ngn":867137877200746.8,
 "nok":12036588440300.268,
 "nzd":1881959441260.691,
 "php":63408833578734.16,
 "pkr":330802212071849.5,
 "pln":4873845314802.727,
 "rub":108044384496188.44,
 "sar":4188781823838.2217,
 "sek":12473334464877.01,
 "sgd":1524184941812.1152,
 "thb":40266575274263.49,
 "try":30188235424072.55,
 "twd":35772425793783.06,
 "uah":41247432728346.46,
 "vef":111817792201.044,
 "vnd":2.723391276847386e+16,
 "zar":21135159644431.85,
 "xdr":846844729094.5121,
 "xag":48129569366.74601,
 "xau":578173811.3868836,
 "bits":41088717961809.9,
 "sats":4108871796180989.5
 },
 "total_volume":{
 "btc":1330972.492812585,
 "eth":22029451.985309657,
 "ltc":537094283.640372,
 "bch":165742340.34521616,
 "bnb":166736158.57572192,
 "eos":62161988251.90748,
 "xrp":70518732891.79572,
 "xlm":307401405098.14435,
 "link":5318131025.902431,
 "dot":8737858068.45117,
 "yfi":6643885.579837273,
 "usd":36173721124.016304,
 "aed":132861736841.97713,
 "ars":12660845801871.064,
 "aud":56044524916.97643,
 "bdt":3970375865977.1016,
 "bhd":13635648003.976847,
 "bmd":36173721124.016304,
 "brl":176184108734.52213,
 "cad":48631082509.820595,
 "chf":32476405087.93065,
 "clp":31990230276023.824,
 "cny":263970495158.2838,
 "czk":828889565461.7828,
 "dkk":252488956073.52164,
 "eur":33873868282.39359,
 "gbp":29191397125.216404,
 "hkd":282920098969.1008,
 "huf":12999811149231.553,
 "idr":556577916644396.3,
 "ils":137818440978.99585,
 "inr":3012442302027.0483,
 "jpy":5348429363070.309,
 "krw":48064980016230.45,
 "kwd":11167623532.848566,
 "lkr":11716732878334.812,
 "mmk":75969117333083.14,
 "mxn":617812791763.1315,
 "myr":169889881258.94223,
 "ngn":28088894452798.67,
 "nok":389897006186.3648,
 "nzd":60961655003.08512,
 "php":2053980203837.6536,
 "pkr":10715560539961.732,
 "pln":157876769342.26212,
 "rub":3499844018033.1924,
 "sar":135685746902.68646,
 "sek":404044367649.36255,
 "sgd":49372390576.81509,
 "thb":1304341111826.0007,
 "try":977876968401.3079,
 "twd":1158763697055.6726,
 "uah":1336113684822.024,
 "vef":3622074696.1477504,
 "vnd":882178626263945.2,
 "zar":684623845993.1329,
 "xdr":27431545592.533077,
 "xag":1559044333.7169642,
 "xau":18728582.37474823,
 "bits":1330972492812.5852,
 "sats":133097249281258.52
 },
 "market_cap_percentage":{
 "btc":47.43505765619223,
 "eth":17.677989463559072,
 "usdt":7.4495200866134965,
 "bnb":2.9887066966451346,
 "xrp":2.440608998429479,
 "usdc":2.3301904400470552,
 "steth":1.2777173693974475,
 "ada":0.8008762550265154,
 "doge":0.7904311180406324,
 "ton":0.7874647627163837
 },
 "market_cap_change_percentage_24h_usd":0.7342065523700237,
 "updated_at":1695156116
 }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
