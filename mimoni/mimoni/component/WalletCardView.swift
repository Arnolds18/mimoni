//
//  CardView.swift
//  mimoni
//
//  Created by Nicky Santano on 11/07/22.
//

import Foundation
import SwiftUI
import Charts

struct WalletCardView: View{
    @Binding var totalSpend: Segment
    @Binding var totalCategory: Segment
    
    var body: some View{
        GeometryReader { geometry in
            VStack(alignment: .leading){

                Spacer()
                Text("Kebutuhan") //nanti ini title segment
                    .font(.title)
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
            .frame(width: .infinity, height: 250)
            
        }
        .frame(height: 50)
        
    }
    
}

struct WalletCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardView(segmentList: .constant(Segment(title: "Test", value: 30, recommended: false)))
                .previewLayout(.sizeThatFits)
        }
    }
}
