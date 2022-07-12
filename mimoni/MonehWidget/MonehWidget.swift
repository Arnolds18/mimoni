//
//  MonehWidget.swift
//  MonehWidget
//
//  Created by ardian kurniawan on 12/07/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct MonehWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(alignment: .leading){
            //            Text(entry.date, style: .time)
            Spacer()
            Text("Sisa Uang:").font(.caption).frame(alignment: .leading)
            Spacer()
            Text("Rp. 2,000,000,-")
            //            Button(action: {
            //                self.title = "dsadsa"
            //            },label: <#T##() -> _#>)
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
    }
}

@main
struct MonehWidget: Widget {
    let kind: String = "MonehWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MonehWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Moneh Widget")
        .description("Moneh widget Small")
        .supportedFamilies([.systemSmall])
    }
}

struct MonehWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonehWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
