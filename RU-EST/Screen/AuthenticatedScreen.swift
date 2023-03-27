//
//  AuthenticatedScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct AuthenticatedScreen: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.authenticationState == .unauthenticated || authVM.authenticationState == .authenticating {
            LoginScreen()
                .environmentObject(authVM)
        } else {
            OrdersScreen()
                .environmentObject(authVM)
        }
    }
}

struct AuthenticatedScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedScreen()
            .environmentObject(AuthViewModel())
    }
}
