//
//  OrdersViewModel.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 06/03/23.
//

import Foundation

class OrdersViewModel: ObservableObject {
    
    @Published var orders: [Order] = []
    
    func getOrders() {
        orders = [
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date()),
            Order(name: "Victor Ordozgoite", date: Date())
        ]
    }
}
