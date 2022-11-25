//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Simon Berner on 23.11.22.
//

import WidgetKit
import SwiftUI
import Intents

// Provides the Timeline
struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    // A timeline is an Array of entries
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = DayEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// Data Model - populate the data with
struct DayEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

// The SwiftUI view
struct MonthlyWidgetEntryView : View {
    var entry: DayEntry

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(.gray.gradient)

            VStack(spacing: 4) {
                HStack {
                    Text("⛄️")
                        .font(.title)
                    Text(entry.date.weekdayDisplayFormat)
                        .font(.title2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(.black.opacity(0.5))
                    Spacer()
                }

                Text(entry.date.dayDisplayFormat)
                    .font(.system(size: 80, weight: .heavy))
                    .padding(2)
            }
            .padding()
        }
    }
}

// This is the actual Widget
struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        /*
         The IntentTimelineProvider (Provider) from above returns an entry (from getSnapshot) which is passed in to the
         content closure.
         (The content closure contains the SwiftUI views that WidgetKit needs to render the widget. When WidgetKit invokes the content closure, it passes a timeline entry created by the widget provider’s getSnapshot(for:in:completion:) or getTimeline(for:in:completion:) method.)
         */
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MonthlyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyWidgetEntryView(entry: DayEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }

    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
