//
//  CardView.swift
//  mimoni
//
//  Created by Nicky Santano on 11/07/22.
//

import Foundation
import SwiftUI

struct CardView: View{
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Image("") //nanti ini Pie Chartnya
            }
            Spacer()
            Text("Kebutuhan") //nanti ini title segment
                .font(.headline)
                .padding(.top)
            HStack{
                Text("Sisa:")
                Text("Rp25000")
                    .font(.headline)
            }
            .padding(.vertical)
            Spacer()
        }
        .padding(10)
        .background(Color.blue)
        .cornerRadius(20)
        .frame(width: 150, height: 150)
        
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardView()
                .previewLayout(.sizeThatFits)
        }
    }
}
