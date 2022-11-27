# Monthly Theme Widget

This is a first small project to learn the fundamentals of how to create a simple Widget for iOS16+.

<p align="center">
    <a href="https://en.wikipedia.org/wiki/IOS">
        <img src="https://img.shields.io/badge/iOS-16+-blue.svg?style=for-the-badge" />
    </a>
    <a href="https://www.swift.org/">
        <img src="https://img.shields.io/badge/Swift-5.7.1-brightgreen.svg?style=for-the-badge&logo=swift" />
    </a>
    <a href="https://developer.apple.com/xcode/swiftui">
        <img src="https://img.shields.io/badge/SwiftUI-blue.svg?style=for-the-badge&logo=swift&logoColor=black" />
    </a>
    <a href="https://developer.apple.com/xcode">
        <img src="https://img.shields.io/badge/Xcode-14.1-blue.svg?style=for-the-badge" />
    </a>
    <a href="https://mastodon.green/@simonberner">
        <img src="https://img.shields.io/badge/Contact-@simonberner-orange?style=for-the-badge" alt="mastodon.green/@simonberner" />
    </a>
    <a href="https://gitmoji.dev">
        <img src="https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=for-the-badge" alt="Gitmoji">
    </a>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/license-MIT-black.svg?style=for-the-badge" />
    </a>
</p>

## Functionality
A simple Date Widget that changes the day at midnight and its theme every month.

## Tech Stack
- Xcode 14.1
- Swift 5.7.1

## Frameworks
- SwiftUI
- WidgetKit

## Device Compatibility
- iPhone >= iOS16
- iPad >= iOS16

## Screenshot
![Monthly Widget](monthly-theme-widget.png)

## Learnings
- A Widget comes in 4 "fixed" sizes: systemSmall, systemMedium, systemLarge, systemExtraLarge
- The shape of a Widget is given
- The content of a widget can only be implemented with SwiftUI (no UIKit)
- The IntentTimelineProvider creates the timeline of the widget when to update its content:
    - placehoder: dummy data (in case there is no data from the snapshot eg. network call needed)
    - getSnapshot: how does the widget look right now (this state is shown in the widget gallery)
    - getTimeline: this is where the timeline actually gets created. It consists of an Array of entries (the data)

## Credits
🙏🏽 Sean Allen
