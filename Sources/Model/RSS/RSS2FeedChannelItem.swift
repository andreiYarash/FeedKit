//
//  RSS2ChannelItem.swift
//
//  Copyright (c) 2016 Nuno Manuel Dias
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

/**
 
 A channel may contain any number of <item>s. An item may represent a
 "story" -- much like a story in a newspaper or magazine; if so its
 description is a synopsis of the story, and the link points to the full
 story. An item may also be complete in itself, if so, the description
 contains the text (entity-encoded HTML is allowed; see examples:
 http://cyber.law.harvard.edu/rss/encodingDescriptions.html), and
 the link and title may be omitted. All elements of an item are optional,
 however at least one of title or description must be present.
 
 */
public class RSS2FeedChannelItem: DublinCoreProtocol, ContentProtocol {
    
    /**
     
     The title of the item.
     
     Example: Venice Film Festival Tries to Quit Sinking
     
     */
    public var title: String?
    
    /**
     
     The URL of the item.
     
     Example: http://nytimes.com/2004/12/07FEST.html
     
     */
    public var link: String?
    
    /**
     
     The item synopsis.
     
     Example: Some of the most heated chatter at the Venice Film Festival this
     week was about the way that the arrival of the stars at the Palazzo del 
     Cinema was being staged.
     
     */
    public var description: String?
    
    /**
     
     Email address of the author of the item.
     
     Example: oprah\@oxygen.net
     
     <author> is an optional sub-element of <item>.
     
     It's the email address of the author of the item. For newspapers and 
     magazines syndicating via RSS, the author is the person who wrote the 
     article that the <item> describes. For collaborative weblogs, the author 
     of the item might be different from the managing editor or webmaster. 
     For a weblog authored by a single individual it would make sense to omit 
     the <author> element.
     
     <author>lawyer@boyer.net (Lawyer Boyer)</author>
     
     */
    public var author: String?
    
    /**
     
     Includes the item in one or more categories.
     
     <category> is an optional sub-element of <item>.
     
     It has one optional attribute, domain, a string that identifies a 
     categorization taxonomy.
     
     The value of the element is a forward-slash-separated string that 
     identifies a hierarchic location in the indicated taxonomy. Processors
     may establish conventions for the interpretation of categories. 
     
     Two examples are provided below:
     
     <category>Grateful Dead</category>
     <category domain="http://www.fool.com/cusips">MSFT</category>
     
     You may include as many category elements as you need to, for different
     domains, and to have an item cross-referenced in different parts of the
     same domain.
     
     */
    public var categories: [RSS2FeedChannelItemCategory]?
    
    /**
     
     URL of a page for comments relating to the item.
     
     Example: http://www.myblog.org/cgi-local/mt/mt-comments.cgi?entry_id=290
     
     <comments> is an optional sub-element of <item>.
     
     If present, it is the url of the comments page for the item.
     
     <comments>http://ekzemplo.com/entry/4403/comments</comments>
     
     More about comments here:
     http://cyber.law.harvard.edu/rss/weblogComments.html
     
     */
    public var comments: String?
    
    /**
     
     Describes a media object that is attached to the item.
     
     <enclosure> is an optional sub-element of <item>.
     
     It has three required attributes. url says where the enclosure is located,
     length says how big it is in bytes, and type says what its type is, a 
     standard MIME type.
     
     The url must be an http url.
     
     <enclosure url="http://www.scripting.com/mp3s/weatherReportSuite.mp3" length="12216320" type="audio/mpeg" />
     
     */
    public var enclosure: RSS2FeedChannelItemEnclosure?
    
    /**
     
     A string that uniquely identifies the item.
     
     Example: http://inessential.com/2002/09/01.php#a2
     
     <guid> is an optional sub-element of <item>.
     
     guid stands for globally unique identifier. It's a string that uniquely 
     identifies the item. When present, an aggregator may choose to use this 
     string to determine if an item is new.
     
     <guid>http://some.server.com/weblogItem3207</guid>
     
     There are no rules for the syntax of a guid. Aggregators must view them 
     as a string. It's up to the source of the feed to establish the 
     uniqueness of the string.
     
     If the guid element has an attribute named "isPermaLink" with a value of 
     true, the reader may assume that it is a permalink to the item, that is, 
     a url that can be opened in a Web browser, that points to the full item 
     described by the <item> element. An example:
     
     <guid isPermaLink="true">http://inessential.com/2002/09/01.php#a2</guid>
     
     isPermaLink is optional, its default value is true. If its value is false,
     the guid may not be assumed to be a url, or a url to anything in 
     particular.
     
     */
    public var guid: RSS2FeedChannelItemGUID?
    
    /**
     
     Indicates when the item was published.
     
     Example: Sun, 19 May 2002 15:21:36 GMT
     
     <pubDate> is an optional sub-element of <item>.
     
     Its value is a date, indicating when the item was published. If it's a 
     date in the future, aggregators may choose to not display the item until 
     that date.
     
     */
    public var pubDate: String?
    
    /**
     
     The RSS channel that the item came from.
     
     <source> is an optional sub-element of <item>.
     
     Its value is the name of the RSS channel that the item came from, derived
     from its <title>. It has one required attribute, url, which links to the
     XMLization of the source.
     
     <source url="http://www.tomalak.org/links2.xml">Tomalak's Realm</source>
     
     The purpose of this element is to propagate credit for links, to 
     publicize the sources of news items. It can be used in the Post command
     of an aggregator. It should be generated automatically when forwarding
     an item from an aggregator to a weblog authoring tool.
     
     */
    public var source: RSS2FeedChannelItemSource?
    
    
    // MARK: - Dublin Core Module
    
    /**
     
     A name given to the resource
     
     */
    public var dcTitle: String?
    
    /**
     
     An entity primarily responsible for making the content of the resource
     
     Examples of a Creator include a person, an organization, or a service.
     Typically, the name of a Creator should be used to indicate the entity.
     
     */
    public var dcCreator: String?
    
    /**
     
     The topic of the content of the resource
     
     Typically, the subject will be represented using keywords, key phrases,
     or classification codes. Recommended best practice is to use a controlled
     vocabulary.  To describe the spatial or temporal topic of the resource,
     use the Coverage element.
     
     */
    public var dcSubject: String?
    
    /**
     
     An account of the content of the resource
     
     Description may include but is not limited to: an abstract, a table of
     contents, a graphical representation, or a free-text account of the
     resource.
     
     */
    public var dcDescription: String?
    
    /**
     
     An entity responsible for making the resource available
     
     Examples of a Publisher include a person, an organization, or a service.
     Typically, the name of a Publisher should be used to indicate the entity.
     
     */
    public var dcPublisher: String?
    
    /**
     
     An entity responsible for making contributions to the content of the
     resource
     
     Examples of a Contributor include a person, an organization, or a service.
     Typically, the name of a Contributor should be used to indicate the entity.
     
     */
    public var dcContributor: String?
    
    /**
     
     A point or period of time associated with an event in the lifecycle of the
     resource.
     
     Date may be used to express temporal information at any level of
     granularity. Recommended best practice is to use an encoding scheme, such
     as the W3CDTF profile of ISO 8601 [W3CDTF].
     
     */
    public var dcDate: String?
    
    /**
     
     The nature or genre of the content of the resource
     
     Recommended best practice is to use a controlled vocabulary such as the
     DCMI Type Vocabulary [DCTYPE].  To describe the file format, physical
     medium, or dimensions of the resource, use the Format element.
     
     */
    public var dcType: String?
    
    /**
     
     The file format, physical medium, or dimensions of the resource.
     
     Examples of dimensions include size and duration. Recommended best
     practice is to use a controlled vocabulary such as the list of Internet
     Media Types [MIME].
     
     */
    public var dcFormat: String?
    
    /**
     
     An unambiguous reference to the resource within a given context.
     
     Recommended best practice is to identify the resource by means of a string
     conforming to a formal identification system.
     
     */
    public var dcIdentifier: String?
    
    /**
     
     A Reference to a resource from which the present resource is derived
     
     The described resource may be derived from the related resource in whole
     or in part. Recommended best practice is to identify the related resource
     by means of a string conforming to a formal identification system.
     
     */
    public var dcSource: String?
    
    /**
     
     A language of the resource.
     
     Recommended best practice is to use a controlled vocabulary such as
     RFC 4646 [RFC4646].
     
     */
    public var dcLanguage: String?
    
    /**
     
     A related resource.
     
     Recommended best practice is to identify the related resource by means of
     a string conforming to a formal identification system.
     
     */
    public var dcRelation: String?
    
    /**
     
     The spatial or temporal topic of the resource, the spatial applicability
     of the resource, or the jurisdiction under which the resource is
     relevant.
     
     Spatial topic and spatial applicability may be a named place or a location
     specified by its geographic coordinates.  Temporal topic may be a named
     period, date, or date range.  A jurisdiction may be a named administrative
     entity or a geographic place to which the resource applies.  Recommended
     best practice is to use a controlled vocabulary such as the Thesaurus of
     Geographic Names [TGN].  Where appropriate, named places or time periods
     can be used in preference to numeric identifiers such as sets of
     coordinates or date ranges.
     
     */
    public var dcCoverage: String?
    
    /**
     
     Information about rights held in and over the resource.
     
     Typically, rights information includes a statement about various property
     rights associated with the resource, including intellectual property
     rights.
     
     */
    public var dcRights: String?
    
    
    // MARK: - Content Module
    
    /// The content:encoded element defines the full content of an item (OPTIONAL). This element has a more precise purpose than the description element, which can be the full content, a summary or some other form of excerpt at the publisher's discretion. The content MUST be suitable for presentation as HTML and be encoded as character data in the same manner as the description element.
    var contentEncoded: String?
    
    // TODO: Uncomment?
//    public init() {}
    
}