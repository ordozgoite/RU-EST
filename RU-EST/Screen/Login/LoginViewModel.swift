//
//  LoginViewModel.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 04/03/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var emailInput = ""
    @Published var passwordInput = ""
}
