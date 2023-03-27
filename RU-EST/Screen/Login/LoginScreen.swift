//
//  LoginScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 03/03/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack {
            HeaderView()
            
            Spacer()
            
            InputView()
            
            Spacer()
            
            LoginButton()
        }
        .padding([.top, .bottom], 16)
    }
    
    //MARK: - Header
    @ViewBuilder
    private func HeaderView() -> some View {
        Image("uea-logo")
            .resizable()
            .frame(width: 192, height: 192)
        
        Text("Restaurante Universitário")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.primaryColor)
    }
    
    //MARK: - InputView
    @ViewBuilder
    private func InputView() -> some View {
        VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 16) {
                Text("E-mail")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryColor)
                TextField("E-mail", text: $authVM.inputEmail)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Password")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryColor)
                TextField("Password", text: $authVM.inputPassword)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding([.leading, .trailing], 32)
    }
    
    //MARK: - Log in Button
    @ViewBuilder
    private func LoginButton() -> some View {
        Button {
            authVM.authenticationState = .authenticated
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.primaryColor)
                    .frame(width: 320, height: 64)
                
                Text("Log in")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .environmentObject(AuthViewModel())
    }
}
