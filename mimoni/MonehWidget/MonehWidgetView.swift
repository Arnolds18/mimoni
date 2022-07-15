//
//  MonehWidgetView.swift
//  MonehWidgetExtension
//
//  Created by ardian kurniawan on 13/07/22.
//

import SwiftUI
import WidgetKit

struct MonehWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    var body: some View {
        switch family{
        case .systemSmall:
            //            Text("Test Widget Small")
            VStack(alignment: .leading){
                //            Text(entry.date, style: .time)
                Spacer()
                Text("Sisa Uang:").font(.caption).frame(alignment: .leading)
                Spacer()
                Text("Rp. 2,000,000,-")
                Spacer()
                Button(action: {""
                }, label: {
                    Text("+Add Expenses")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.yellow
                            .cornerRadius (8)
                        )
                })
                Spacer()
            }
        case .systemMedium:
            //            Text("Test Widget Medium")
            VStack{
                //            Text(entry.date, style: .time)
                HStack{
                    VStack(alignment: .leading){
                        Text("Sisa Uang:").font(.caption).frame(alignment: .leading)
                        Text("Rp. 2,000,000,-")
                    }
                    Spacer()
                    Button(action: {""
                    }, label: {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            )
                    })
                }
                Spacer()
                HStack{
                    VStack{
                        ZStack(alignment: .leading){
                            Circle() //circle yang belakang
                                .trim(from: 0, to: 1)
                                .stroke(Color.yellow.opacity(0.25), lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            
                            
                            Circle() //circle depan buat tau datanya berapa
                                .trim(from: 0.4, to: 0.75) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                                .stroke(Color.yellow, lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            Text("36%")
                                .frame(maxWidth: 41, alignment: .center)
                                .font(.system(size: 8))
                        }.padding(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                        Text("Kebutuhan")
                            .font(.system(size: 8).weight(.semibold))
                    }
                    Spacer()
                    VStack{
                        ZStack(alignment: .leading){
                            Circle() //circle yang belakang
                                .trim(from: 0, to: 1)
                                .stroke(Color.red.opacity(0.25), lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            
                            Circle() //circle depan buat tau datanya berapa
                                .trim(from: 0.2, to: 0.75) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                                .stroke(Color.red, lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            Text("56%")
                                .frame(maxWidth: 41, alignment: .center)
                                .font(.system(size: 8))
                        }.padding(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                        Text("Keinginan")
                            .font(.system(size: 8).weight(.semibold))
                    }
                    Spacer()
                    VStack{
                        ZStack(alignment: .leading){
                            Circle() //circle yang belakang
                                .trim(from: 0, to: 1)
                                .stroke(Color.green.opacity(0.25), lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            
                            Circle() //circle depan buat tau datanya berapa
                                .trim(from: 0.090, to: 0.75) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                                .stroke(Color.green, lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            Text("75%")
                                .frame(maxWidth: 41, alignment: .center)
                                .font(.system(size: 8))
                        }.padding(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                        Text("Tabungan")
                            .font(.system(size: 8).weight(.semibold))
                    }
                    Spacer()
                    VStack{
                        ZStack(alignment: .leading){
                            Circle() //circle yang belakang
                                .trim(from: 0, to: 1)
                                .stroke(Color.purple.opacity(0.25), lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            Circle() //circle depan buat tau datanya berapa
                                .trim(from: 0, to: 0.75) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                                .stroke(Color.purple, lineWidth: 8)
                                .frame(width: (UIScreen.main.bounds.width - 310) / 2, height: (UIScreen.main.bounds.width - 310) / 2)
                            Text("80%")
                                .frame(maxWidth: 41, alignment: .center)
                                .font(.system(size: 8))
                        }.padding(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                        Text("Dana darurat")
                            .font(.system(size: 8).weight(.semibold))
                    }
                }
            }.padding(25)
        default:
            Text("None")
            //            VStack(alignment: .leading){
            //                //            Text(entry.date, style: .time)
            //                Spacer()
            //                Text("Sisa Uang:").font(.caption).frame(alignment: .leading)
            //                Spacer()
            //                Text("Rp. 2,000,000,-")
            //                Spacer()
            //                Button(action: {""
            //                }, label: {
            //                    Text("+Add Expenses")
            //                        .font(.caption)
            //                        .fontWeight(.semibold)
            //                        .foregroundColor(.black)
            //                        .padding()
            //                        .background(Color.yellow
            //                            .cornerRadius (8)
            //                        )
            //                })
            //                Spacer()
            //            }
        }
    }
}

struct MonehWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MonehWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonehWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
