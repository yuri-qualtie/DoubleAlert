//
//  AlertContext.swift
//  DoubleAlert
//
//  Created by Yuri Goncharov on 30.08.2021.
//

import SwiftUI

enum AlertContext {
    case error(message: String)
    case welcome
    
    public func alert() -> Alert {
        switch self {
        case .error(let message):
            return Alert(title: Text("Error"), message: Text(message), dismissButton: .cancel())
        case .welcome:
            return Alert(title: Text("Welcome"))
        }
    }
}

extension AlertContext: Identifiable {
    var id: String {
        String(describing: self)
    }
}
