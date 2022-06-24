//
//  SetupBudget.swift
//  mimoni
//
//  Created by Arnold Sidiprasetija on 24/06/22.
//

import SwiftUI

struct SetupBudget: View {
    @Binding var income: Int
    var body: some View {
        VStack{
            Text("Income")
                .fontWeight(.bold)
                .font(.system(size: 31))
            Text("Rp. \(income)")
                .fontWeight(.bold)
                .font(.system(size: 31))
        }
    }
}

struct SetupBudget_Previews: PreviewProvider {
    static var previews: some View {
        SetupBudget(income: .constant(1000))
    }
}
