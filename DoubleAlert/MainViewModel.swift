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
    
    let alertModel: AlertModel
    
    init(alertModel: AlertModel) {
        self.alertModel = alertModel
    }
    
    func login() {
        present(.welcome)
        route(to: .profile)
    }
    
    func logout() {
        route(to: .login)
        present(.error(message: "Some API error occured."))
    }
    
    private func present(_ alertContext: AlertContext) {
        //DispatchQueue.main.async {
            self.alertModel.alertContext = alertContext
        //}
    }
}

// Router:

extension MainViewModel {
    func transition(to state: AppState) {
        let fadeOutTimeSeconds = 0.25
        withAnimation(.easeIn(duration: fadeOutTimeSeconds)) {
            self.state = .transition
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + fadeOutTimeSeconds) {
            withAnimation(.linear(duration: 0.5)) {
                self.state = state
            }
        }
    }
    
    private func route(to state: AppState) {
        transition(to: state)
    }
}
