//
//  LaunchScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 17/03/23.
//

import SwiftUI

struct LaunchScreen: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @State private var moveToNext: Bool = false
    
    var body: some View {
        NavigationView{
            if moveToNext{
                AuthenticatedScreen()
                    .environmentObject(authVM)
            }else{
                ZStack {
                    Image("uea-logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.moveToNext = true
            })
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
            .environmentObject(AuthViewModel())
    }
}
