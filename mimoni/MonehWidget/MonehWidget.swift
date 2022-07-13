//
//  MonehWidget.swift
//  MonehWidget
//
//  Created by ardian kurniawan on 12/07/22.
//

import WidgetKit
import SwiftUI
import Intents


@main
struct MonehWidgetBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        MonehWidget()
    }
}

struct MonehWidget: Widget {
    let kind: String = "MonehWidgetSmall"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MonehWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Moneh Widget")
        .description("Moneh widget Small")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}


