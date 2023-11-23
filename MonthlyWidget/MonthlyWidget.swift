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
        DayEntry(date: Date(), showFunFont: false)
    }

    // Snapshot for the widget gallery
    func getSnapshot(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (DayEntry) -> Void) {
        let entry = DayEntry(date: Date(), showFunFont: false)
        completion(entry)
    }

    // A timeline is an Array of entries
    func getTimeline(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (Timeline<DayEntry>) -> Void) {
        var entries: [DayEntry] = []

        let showFunFont = configuration.funFont == 1 // showFunFont = true, else false

        // Generate a timeline consisting of seven entries a day apart, starting from the current date.
        let currentDate = Date() // the current date is the date AND the time (eg. 24/8 2:50pm)
        for dayOffset in 0 ..< 7 {
            // add 1 day to 0...
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            print("entryDate: \(entryDate)")
            // we want to switch over our date at midnight
            // so we set the start of the day to midnight (and not some random time)
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            print("startOfDate: \(startOfDate)")
            let entry = DayEntry(date: startOfDate, showFunFont: showFunFont)
            entries.append(entry) // adds 7 day entries
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// Data Model - populate the data with
struct DayEntry: TimelineEntry {
    let date: Date
    let showFunFont: Bool
}

// The SwiftUI view
struct MonthlyWidgetEntryView : View {
    // If false (it is in StandBy mode: it is not showing the background) means there is no padding
    @Environment(\.showsWidgetContainerBackground) var showsBackground
    // If it is true (when mode is .vibrant), means it is in StandBy Night Mode
//    @Environment(\.widgetRenderingMode) var renderingMode
    var entry: DayEntry
    var config: MonthConfig
    let funFontName = "Chalkduster"

    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(config.emojiText)
                    .font(.title)
                Text(entry.date.weekdayDisplayFormat)
                    .font(entry.showFunFont ? .custom(funFontName, size: 20) : .title3)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(showsBackground ? config.weekdayTextColor : .white)
                Spacer()
            }
            .id(entry.date)
            .transition(.push(from: .trailing))
            .animation(.bouncy, value: entry.date)

            Text(entry.date.dayDisplayFormat)
                .font(entry.showFunFont ? .custom(funFontName, size: 80) : .system(size: 80, weight: .heavy))
                .foregroundStyle(showsBackground ? config.dayTextColor : .white)
                .contentTransition(.numericText())
        }
        .containerBackground(for: .widget) {
            ContainerRelativeShape()
                .fill(config.backgroundColor.gradient)
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
        IntentConfiguration(kind: kind, intent: ChangeFontIntent.self, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("The theme of the widget changes based on the month.")
        .supportedFamilies([.systemSmall])
//        .disfavoredLocations([.lockScreen], for: [.systemSmall]) // Tweak where a widget should not show up
    }
}

#Preview(as: .systemSmall, widget: {
    MonthlyWidget()
}, timeline: {
    MockData.dayOne
    MockData.dayTwo
    MockData.dayThree
    MockData.dayFour
})

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }

    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}

struct MockData {
    static let dayOne = DayEntry(date: dateToDisplay(month: 11, day: 4), showFunFont: false)
    static let dayTwo = DayEntry(date: dateToDisplay(month: 11, day: 5), showFunFont: false)
    static let dayThree = DayEntry(date: dateToDisplay(month: 11, day: 6), showFunFont: false)
    static let dayFour = DayEntry(date: dateToDisplay(month: 11, day: 7), showFunFont: false)

    // helper to test it
    private static func dateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current, year: 2022, month: month, day: day)

        return Calendar.current.date(from: components)!
    }
}
