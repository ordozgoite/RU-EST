//
//  Order.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 06/03/23.
//

import Foundation

struct Order: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
}
