//
//  DoubleAlertApp.swift
//  DoubleAlert
//
//  Created by Yuri Goncharov on 30.08.2021.
//

import SwiftUI

@main
struct DoubleAlertApp: App {
    @ObservedObject var alertModel: AlertModel
    @ObservedObject var viewModel: MainViewModel
    
    init() {
        let alertModel = AlertModel()
        self.alertModel = alertModel
        viewModel = MainViewModel(alertModel: alertModel)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
                .frame(width: 300, height: 300)
            Spacer()
                .alert(item: $alertModel.alertContext) {
                    $0.alert()
                }
        }
    }
}
