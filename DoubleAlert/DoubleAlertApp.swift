//
//  DoubleAlertApp.swift
//  DoubleAlert
//
//  Created by Yuri Goncharov on 30.08.2021.
//

import SwiftUI

@main
struct DoubleAlertApp: App {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
                .frame(width: 300, height: 300)
                .alert(item: $viewModel.alertContext) {
                    $0.alert()
                }
        }
    }
}
