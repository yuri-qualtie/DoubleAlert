//
//  MainViewModel.swift
//  DoubleAlert
//
//  Created by Yuri Goncharov on 30.08.2021.
//

import Combine
import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var state: AppState = .login
    @Published var alertContext: AlertContext?
    
    func login() {
        present(.welcome)
        navigate(.profile)
    }
    
    func logout() {
        navigate(.login)
        present(.error(message: "Some API error occured."))
    }
    
    private func navigate(_ state: AppState) {
        withAnimation(.linear(duration: 0.5)) {
            self.state = state
        }
    }
    
    private func present(_ alertContext: AlertContext) {
        DispatchQueue.main.async {
            self.alertContext = alertContext
        }
    }
}
