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
            Text("Test Widget Medium")
//                        VStack(alignment: .leading){
//                                    //            Text(entry.date, style: .time)
//                                    Spacer()
//                                    Text("Sisa Uang:").font(.caption).frame(alignment: .leading)
//                                    Spacer()
//                                    Text("Rp. 2,000,000,-")
//                                    Spacer()
//                                    Button(action: {""
//                                    }, label: {
//                                        Text("+Add Expenses")
//                                            .font(.caption)
//                                            .fontWeight(.semibold)
//                                            .foregroundColor(.black)
//                                            .padding()
//                                            .background(Color.yellow
//                                                .cornerRadius (8)
//                                            )
//                                    })
//                                    Spacer()
//                                }
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
