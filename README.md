<h1 align=center>Monthly Theme Widget</h1>

<p align="center">
    <a href="https://en.wikipedia.org/wiki/IOS">
        <img src="https://img.shields.io/badge/iOS-17+-blue.svg?style=for-the-badge" />
    </a>
    <a href="https://www.swift.org/">
        <img src="https://img.shields.io/badge/Swift-5.9-brightgreen.svg?style=for-the-badge&logo=swift" />
    </a>
    <a href="https://developer.apple.com/xcode/swiftui">
        <img src="https://img.shields.io/badge/SwiftUI-blue.svg?style=for-the-badge&logo=swift&logoColor=black" />
    </a>
    <a href="https://developer.apple.com/xcode">
        <img src="https://img.shields.io/badge/Xcode-15.0-blue.svg?style=for-the-badge" />
    </a>
    <a href="https://mastodon.green/@simonberner">
        <img src="https://img.shields.io/badge/Contact-@simonberner-orange?style=for-the-badge" alt="mastodon.green/@simonberner" />
    </a>
    <a href="https://gitmoji.dev">
        <img src="https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=for-the-badge" alt="Gitmoji">
    </a>
    <a href="https://github.com/conventional-commits/conventionalcommits.org">
        <img src="https://img.shields.io/badge/Conventional%20Commits-📝-lightgrey.svg?style=for-the-badge" alt="Conventional Commits">
    </a>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/license-MIT-black.svg?style=for-the-badge" />
    </a>
</p>

A small project to learn the fundamentals of how to create a simple Widget with an intent and configuration for iOS 17+.

---

## Contents
* [Functionality](#functionality)
* [Tech Stack](#tech-stack)
* [Frameworks](#frameworks)
* [Device Compatibility](#device-compatibility)
* [Screenshots](#screenshots)
* [Learnings](#learnings)
* [Code Comments](#code-comments)
* [Pull Requests](#pull-requests)
* [Credits](#credits)

---

## Functionality
A simple Date Widget that changes the day at midnight and its theme every month. With iOS17+ it is also available in the [StandBy mode](https://support.apple.com/en-gb/guide/iphone/iph878d77632/ios).

## Tech Stack
- Xcode 15.0
- Swift 5.9

## Frameworks
- SwiftUI
- WidgetKit

## Device Compatibility
- iPhone with iOS 17+
- iPad with iOS 17+

## Screenshots
| Widget Normal Font | Intent |
| :---: | :---: |
| <img src="AppScreenshots/MonthlyWidgetNormalFont.png" height="100%" width="100%" > | <img src="AppScreenshots/MonthlyWidgetIntent.png" height="100%" width="100%" > |

| Configuration | Widget Fun Font |
| :---: | :---: |
| <img src="AppScreenshots/MonthlyWidgetConfiguration.png" height="100%" width="100%" > | <img src="AppScreenshots/MonthlyWidgetFunFont.png" height="100%" width="100%" > |

| Different Days Overview |
| :---: |
| <img src="AppScreenshots/MonthlyWidgetAll.png" height="100%" width="100%" > |

## Learnings
- A Widget comes in 4 "fixed" sizes: systemSmall, systemMedium, systemLarge, systemExtraLarge
- The shape of a Widget is given
- The content of a widget can only be implemented with SwiftUI (no UIKit)
- The IntentTimelineProvider creates the timeline of the widget when to update its content:
    - placehoder: dummy data (in case there is no data from the snapshot eg. network call needed)
    - getSnapshot: how does the widget look right now (this state is shown in the widget gallery)
    - getTimeline: this is where the timeline actually gets created. It consists of an Array of entries (the data)
### Fonts
- [Best Free Fonts for iOS app](https://sarunw.com/posts/free-fonts-ios/)
- [List all fonts available on iOS device in console](https://gist.github.com/simonbromberg/24a48fb5e94b2bde82df1e5c97e733da)
- [Old list of iOS fonts](http://iosfonts.com/)
### Widget Intent & Configuration
- 1. Create a intent definition file add some intents with parameters
- 2. Add the IntentConfiguration to the Widget, which then takes in a IntentTimelineProvider

## Code Comments
I love putting in the effort of adding comments to my code, [here is why](https://www.youtube.com/watch?v=1NEa-OcsTow).

## Pull Requests
When I create PRs I stick to [this guideline](https://www.youtube.com/watch?v=_sfzAOfY8uc).

## Credits
🙏🏽 Sean Allen iOS Courses

<hr>
<p align="center">
Made with a 🙂 <a href="https://simonberner.dev">Simon Berner
</p>
