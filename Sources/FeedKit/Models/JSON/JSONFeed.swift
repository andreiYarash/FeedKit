//
//  JSONFeed.swift
//
//  Copyright (c) 2016 - 2018 Nuno Manuel Dias
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

/// The JSON Feed format is a pragmatic syndication format, like RSS and Atom, 
/// but with one big difference: it's JSON instead of XML.
/// See https://jsonfeed.org/version/1
public struct JSONFeed {
    
    /// (required, string) is the URL of the version of the format the feed
    /// uses. This should appear at the very top, though we recognize that not all
    /// JSON generators allow for ordering.
    public var version: String?
    
    /// (required, string) is the name of the feed, which will often correspond to
    /// the name of the website (blog, for instance), though not necessarily.
    public var title: String?
    
    /// (optional but strongly recommended, string) is the URL of the resource that
    /// the feed describes. This resource may or may not actually be a "home" page,
    /// but it should be an HTML page. If a feed is published on the public web, 
    /// this should be considered as required. But it may not make sense in the 
    /// case of a file created on a desktop computer, when that file is not shared 
    /// or is shared only privately.
    public var homePageURL: String?
    
    /// (optional but strongly recommended, string) is the URL of the feed, and 
    /// serves as the unique identifier for the feed. As with home_page_url, this 
    /// should be considered required for feeds on the public web.
    public var feedUrl: String?
     
    /// (optional, string) provides more detail, beyond the title, on what the feed
    /// is about. A feed reader may display this text.
    public var description: String?

    /// (optional, string) is a description of the purpose of the feed. This is for 
    /// the use of people looking at the raw JSON, and should be ignored by feed 
    /// readers.
    public var userComment: String?
    
    /// (optional, string) is the URL of a feed that provides the next n items, 
    /// where n is determined by the publisher. This allows for pagination, but 
    /// with the expectation that reader software is not required to use it and 
    /// probably won't use it very often. next_url must not be the same as 
    /// feed_url, and it must not be the same as a previous next_url (to avoid 
    /// infinite loops).
    public var nextUrl: String?
    
    /// (optional, string) is the URL of an image for the feed suitable to be used
    /// in a timeline, much the way an avatar might be used. It should be square
    /// and relatively large - such as 512 x 512 - so that it can be scaled-down
    /// and so that it can look good on retina displays. It should use transparency
    /// where appropriate, since it may be rendered on a non-white background.
    public var icon: String?
    
    /// (optional, string) is the URL of an image for the feed suitable to be used
    /// in a source list. It should be square and relatively small, but not smaller
    /// than 64 x 64 (so that it can look good on retina displays). As with icon, 
    /// this image should use transparency where appropriate, since it may be 
    /// rendered on a non-white background.
    public var favicon: String?
    
    /// (optional, object) specifies the feed author. The author object has 
    /// several members. These are all optional - but if you provide an author 
    /// object, then at least one is required.
    public var author: JSONFeedAuthor?
    
    /// (optional, boolean) says whether or not the feed is finished - that is, 
    /// whether or not it will ever update again. A feed for a temporary event, 
    /// such as an instance of the Olympics, could expire. If the value is true, 
    /// then it's expired. Any other value, or the absence of expired, means the 
    /// feed may continue to update.
    public var expired: Bool?
    
    /// (very optional, array of objects) describes endpoints that can be used to 
    /// subscribe to real-time notifications from the publisher of this feed. Each 
    /// object has a type and url, both of which are required.
    public var hubs: [JSONFeedHub]?
    
    /// The JSONFeed items.
    public var items: [JSONFeedItem]?
    
}

// MARK: - Equatable

extension JSONFeed: Equatable {}

// MARK: - Decodable

extension JSONFeed: Decodable {

    enum CodingKeys: String, CodingKey {
        case version
        case title
        case userComment
        case homePageUrl
        case description
        case feedUrl
        case nextUrl
        case icon
        case favicon
        case expired
        case author
        case hubs
        case items
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        userComment = try values.decodeIfPresent(String.self, forKey: .userComment)
        homePageURL = try values.decodeIfPresent(String.self, forKey: .homePageUrl)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        feedUrl = try values.decodeIfPresent(String.self, forKey: .feedUrl)
        nextUrl = try values.decodeIfPresent(String.self, forKey: .nextUrl)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        favicon = try values.decodeIfPresent(String.self, forKey: .favicon)
        expired = try values.decodeIfPresent(Bool.self, forKey: .expired)
        author = try values.decodeIfPresent(JSONFeedAuthor.self, forKey: .author)
        hubs = try values.decodeIfPresent([JSONFeedHub].self, forKey: .hubs)
        items = try values.decodeIfPresent([JSONFeedItem].self, forKey: .items)
    }

}
