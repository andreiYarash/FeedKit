//
//  FeedParser.swift
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
import Dispatch
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// An RSS and Atom feed parser. `FeedParser` uses `Foundation`'s `XMLParser`.
public final class FeedParser {

    private let dataSource: DataSource

    private enum DataSource {
        case data(Data)
        case xmlStream(InputStream)
    }
    
    /// A FeedParser handler provider.
    private var parser: FeedParserProtocol?

    /// Initializes the parser with the xml or json contents encapsulated in a 
    /// given data object.
    ///
    /// - Parameter data: XML or JSON data
    public init(data: Data) {
        self.dataSource = .data(data)
    }
    
    /// Initializes the parser with the XML contents encapsulated in a
    /// given InputStream.
    ///
    /// - Parameter xmlStream: An InputStream that yields XML data.
    public init(xmlStream: InputStream) {
        self.dataSource = .xmlStream(xmlStream)
    }
    
    /// Starts parsing the feed.
    ///
    /// - Returns: The parsed `Result`.
    public func parse() -> Result<Feed, ParserError> {
        
        let parser: FeedParserProtocol

        switch dataSource {
        case .data(let data):
            guard let feedDataType = FeedDataType(data: data) else {
                return .failure(.feedNotFound)
            }

            switch feedDataType {
            case .json: parser = JSONFeedParser(data: data)
            case .xml:  parser = XMLFeedParser(data: data)
            }

        case let .xmlStream(xmlStream):
            parser = XMLFeedParser(stream: xmlStream)
        }

        self.parser = parser

        return parser.parse()
        
    }
    
    /// Starts parsing the feed asynchronously. Parsing runs by default on the
    /// global queue. You are responsible to manually bring the result closure
    /// to whichever queue is apropriate, if any.
    ///
    /// Usually to the Main queue if UI Updates are needed.
    ///
    ///     DispatchQueue.main.async {
    ///         // UI Updates
    ///     }
    ///
    /// - Parameters:
    ///   - queue: The queue on which the completion handler is dispatched.
    ///   - result: The parsed `Result`.
    public func parseAsync(
        queue: DispatchQueue = DispatchQueue.global(),
        result: @escaping (Result<Feed, ParserError>) -> Void)
    {
        queue.async {
            result(self.parse())
        }
    }
    
    /// Stops parsing XML feeds.
    public func abortParsing() {
        parser?.stopParsing()
    }
    
}
