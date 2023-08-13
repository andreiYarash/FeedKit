![FeedKit](/FeedKit.png?raw=true)

[![build status](https://travis-ci.org/nmdias/FeedKit.svg)](https://travis-ci.org/nmdias/FeedKit)
[![language](https://img.shields.io/badge/spm-compatible-brightgreen.svg)](https://swift.org)
[![swift](https://img.shields.io/badge/swift-5.7-orange.svg)](https://github.com/nmdias/DefaultsKit/releases)

## Features

- [x] [Atom](https://datatracker.ietf.org/doc/html/rfc4287)
- [x] RSS [0.90](https://www.rssboard.org/rss-0-9-0), [0.91](https://www.rssboard.org/rss-0-9-1), [1.00](https://web.resource.org/rss/1.0/spec), [2.00](https://cyber.harvard.edu/rss/rss.html)
- [x] [JSON](https://www.jsonfeed.org/version/1/)  
- [x] Namespaces
    - [x] [Dublin Core](https://web.resource.org/rss/1.0/modules/dc/)
    - [x] [Syndication](https://web.resource.org/rss/1.0/modules/syndication/)
    - [x] [Content](https://web.resource.org/rss/1.0/modules/content/)
    - [x] [Media RSS](https://www.rssboard.org/media-rss)
    - [x] [iTunes Podcasting Tags](https://help.apple.com/itc/podcasts_connect/#/itcb54353390)
- [x] Documentation
- [x] Unit Test Coverage

## Basic Usage

Create a `FeedParser` and provide with `Data` or an `InputStream`, that represents an Atom, JSON, or RSS feed:
```swift
let parser = FeedParser(data: data) // or FeedParser(xmlStream: stream)
```

Then call `parse` to start parsing the feed:
```swift
let result = parser.parse()
```

FeedKit returns a `Result<Feed, ParserError>`, and as such, if parsing succeeds you should now have a strongly-typed model of an `RSS`, `Atom` or `JSON Feed`, within the `Feed` enum:

```swift
switch result {
case .success(let feed):
    
    // Get the parsed feed directly as an optional Atom, JSON, or RSS feed object
    feed.atomFeed
    feed.jsonFeed
    feed.rssFeed
    
    // Or alternatively...
    switch feed {
    case let .atom(feed):       // Atom Syndication Format Feed Model
    case let .json(feed):       // JSON Feed Model
    case let .rss(feed):        // Really Simple Syndication Feed Model
    }
    
case .failure(let error):
    print(error)
}
```

## Installation

### Swift Package Manager (Xcode):
1. From the **File** menu, select **Add Packages…**
2. Enter "https://github.com/sebj/FeedKit" into the package repository URL text field

### Swift Package Manager (standalone):

Add the following to the `dependencies` of your `Package.swift` file:

`.package(url: "https://github.com/sebj/FeedKit.git", ...)`

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
