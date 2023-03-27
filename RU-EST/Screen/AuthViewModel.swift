//
//  AuthViewModel.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import Foundation
import FirebaseAuth

enum AuthenticationState {
  case unauthenticated
  case authenticating
  case authenticated
}

class AuthViewModel: ObservableObject {
    
    @Published var inputEmail: String = ""
    @Published var inputPassword: String = ""
    @Published var inputConfirmPassword: String = ""
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var user: User?
    
}

//MARK: - Email and Password Auth

extension AuthViewModel {
    func signInWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            _ = try await Auth.auth().signIn(withEmail: inputEmail, password: inputPassword)
            return true
        } catch {
            print("❌ Error: \(error)")
//            overlayError = (true, error.localizedDescription)
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signUpWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            _ = try await Auth.auth().createUser(withEmail: inputEmail, password: inputPassword)
            return true
        } catch {
            print("❌ Error: \(error)")
//            overlayError = (true, error.localizedDescription)
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            return true
        } catch {
//            overlayError = (true, error.localizedDescription)
            return false
        }
    }
}
