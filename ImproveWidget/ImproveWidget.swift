//
//  My_Widget.swift
//  My Widget
//
//  Created by Ryan Haraki on 2021-04-27.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    // Render dummy data
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), challengeText: "", configuration: ConfigurationIntent())
    }

    // Latest snapshot
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), challengeText: "", configuration: configuration)
        completion(entry)
    }

    // Wrap array of entries, provides collection of widget states
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let userDefaults = UserDefaults(suiteName: "group.com.haraki.goodday")
        let text = userDefaults?.value(forKey: "challenge") as? String ?? "No Text"
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, challengeText: text, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let challengeText: String
    let configuration: ConfigurationIntent
}

struct My_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack(alignment: .leading) {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipped()
              
                
            
            Text(entry.challengeText)
                .font(.system(size: 24, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .padding(50)
        }
 
    }
}



@main
struct My_Widget: Widget {
    let kind: String = "My_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            My_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct My_Widget_Previews: PreviewProvider {
    static var previews: some View {
        My_WidgetEntryView(entry: SimpleEntry(date: Date(), challengeText: "Hello Widget!", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
