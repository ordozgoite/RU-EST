//
//  ConfirmOrderScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct ConfirmOrderScreen: View {
    
    var customer: Customer
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(customer.name)
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Text("Almoço")
                Text("-")
                Text("R$0,80")
            }
            .font(.title2)
            .fontWeight(.light)
            
            Spacer()
            
            NavigationLink(destination: PaymentScreen()) {
                ZStack {
                    Rectangle()
                        .fill(Color.primaryColor)
                        .frame(width: 320, height: 64)
                    
                    Text("Confirmar Pedido")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationTitle("Pedido")
    }
}

struct ConfirmOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrderScreen(customer: Customer(_id: "1", name: "Victor Ordozgoite", barcode: "1"))
    }
}

class NavigationControllerHolder {
    weak var value: UINavigationController?
}

struct NavigationControllerKey: EnvironmentKey {
    static let defaultValue: NavigationControllerHolder = NavigationControllerHolder()
}

extension EnvironmentValues {
    var navigationController: UINavigationController? {
        get { self[NavigationControllerKey.self].value }
        set { self[NavigationControllerKey.self].value = newValue }
    }
}

extension View {
    func injectNavigationController(_ navigationController: UINavigationController?) -> some View {
        return self.environment(\.navigationController, navigationController)
    }
}
