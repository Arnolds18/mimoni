//
//  NavBarBackButton.swift
//  Mimoni Ngang Ngong Ngeng
//
//  Created by Fanny Halim on 12/07/22.
//

import SwiftUI

struct NavBarBackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Back")
                .font(.body)
                .foregroundColor(Color.interactiveColor)
        }
    }
}

//struct NavBarBackButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarBackButton()
//    }
//}
