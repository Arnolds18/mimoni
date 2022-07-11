//
//  textfield.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 11/07/22.
//

import Foundation
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(12)
            .shadow(color: .gray, radius: 8, x: 0, y: 4)
            .frame(width: 340, height: 49)
    }
}
