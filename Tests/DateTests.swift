//
//  DateTests.swift
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

import XCTest
@testable import FeedKit

class DateTests: BaseTestCase {
    
    func testRFC822DateFormatter() {
        
        // Given
        let rfc822DateFormatter = RFC822DateFormatter()
        let dateString = "Tue, 04 Feb 2014 22:03:45 Z"
        
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        // When
        let date = rfc822DateFormatter.date(from: dateString)
        
        // Then
        XCTAssertNotNil(date)
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)
        
        XCTAssertEqual(components.day, 4)
        XCTAssertEqual(components.month, 2)
        XCTAssertEqual(components.year, 2014)
        XCTAssertEqual(components.hour, 22)
        XCTAssertEqual(components.minute, 3)
        XCTAssertEqual(components.second, 45)
        
    }
    
    func testRFC3339DateFormatter() {
        
        // Given
        let rfc3339DateFormatter = RFC3339DateFormatter()
        let dateString = "2016-01-15T15:54:10-01:00"
        
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        // When
        let date = rfc3339DateFormatter.date(from: dateString)
        
        // Then
        XCTAssertNotNil(date)
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)
        
        XCTAssertEqual(components.day, 15)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.year, 2016)
        XCTAssertEqual(components.hour, 16)
        XCTAssertEqual(components.minute, 54)
        XCTAssertEqual(components.second, 10)
        
    }
    
    func testISO8601DateFormatter() {
        
        // Given
        let iso8601DateFormatter = RFC3339DateFormatter()
        let dateStrings = [
            "1994-11-05T08:15:30-05:00",
            "1994-11-05T13:15:30"
        ]
        
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        // When
        dateStrings.forEach { dateString in
            let date = iso8601DateFormatter.date(from: dateString)

            // Then
            XCTAssertNotNil(date)

            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)

            XCTAssertEqual(components.day, 5)
            XCTAssertEqual(components.month, 11)
            XCTAssertEqual(components.year, 1994)
            XCTAssertEqual(components.hour, 13)
            XCTAssertEqual(components.minute, 15)
            XCTAssertEqual(components.second, 30)
        }
    }
    
}
