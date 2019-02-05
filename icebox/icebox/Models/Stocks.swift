//
//  Stocks.swift
//  icebox
//
//  Created by Jesús Tirado on 1/25/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import Foundation

struct StockTable: Codable {
    let name: String
    let temp: String
    let date: String
    let time: String
}

struct FreezerDetail {
    let name: String
    let location: String
    let prot: String
    let responsable: String
    let tempMax: Int
    let tempMin: Int
}

