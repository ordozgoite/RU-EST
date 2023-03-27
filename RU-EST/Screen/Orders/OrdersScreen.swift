//
//  OrdersScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 06/03/23.
//

import SwiftUI

struct OrdersScreen: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @ObservedObject private var ordersVM = OrdersViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                OrderList()
            }
            .navigationTitle("Vendas")
            .toolbar {
                // SIGN OUT
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(role: .destructive) {
                        authVM.authenticationState = .unauthenticated
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                    }
                    
                }
                // BARCODE SCAN
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ScanScreen()) {
                        Image(systemName: "barcode.viewfinder")
                    }
                }
            }
        }
        .injectNavigationController(UIApplication.shared.windows.first?.rootViewController as? UINavigationController)
        .onAppear {
            ordersVM.getOrders()
        }
    }
    
    //MARK: - Order List
    @ViewBuilder
    private func OrderList() -> some View {
        List {
            ForEach($ordersVM.orders) { $order in
                OrderCell(order: order)
            }
        }
    }
}

struct OrdersScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrdersScreen()
    }
}
