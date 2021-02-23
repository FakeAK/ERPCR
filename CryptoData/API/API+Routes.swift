//
//  API+Routes.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 20/02/2021.
//

import Foundation

extension API {
    enum Routes: String {
        case availableCoinsList = "/data/blockchain/list"
        case marketCapFullData = "/data/top/mktcapfull?page=%d&limit=%d&tsym=%@"
        case coinVolume = "/data/v2/histoday?fsym=%@&tsym=%@&limit=%d"
    }
}
