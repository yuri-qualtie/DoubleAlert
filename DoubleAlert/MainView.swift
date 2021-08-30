//
//  ContentView.swift
//  DoubleAlert
//
//  Created by Yuri Goncharov on 30.08.2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        switch viewModel.state {
        case .login:
            HStack {
                Button("Login", action: viewModel.login)
            }
        case .profile:
            VStack {
                Text("Profile!")
                Button("Logout", action: viewModel.logout)
            }
        }
    }
}
