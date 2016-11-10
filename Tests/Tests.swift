// The MIT License (MIT)
//
// Copyright (c) 2014 Suyeol Jeon (http:xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import XCTest
@testable import UITextView_Placeholder

class Tests: XCTestCase {

    var textView: UITextView!

    // MARK: Setup

    override func setUp() {
        super.setUp()
        self.textView = UITextView()
    }


    // MARK: Basic Tests

    func testPlaceholder() {
        self.textView.placeholder = "Hello"
        XCTAssertEqual(self.textView.placeholderLabel.text, "Hello")
        self.textView.placeholder = nil
        XCTAssertEqual(self.textView.placeholderLabel.text, nil)
    }

    func testAttributedPlaceholder() {
        let attributedPlaceholder = attributedString("Hello", .bold(26))
        self.textView.attributedPlaceholder = attributedPlaceholder
        XCTAssertEqual(self.textView.attributedPlaceholder, attributedPlaceholder)
    }


    // MARK: Fonts

    func testSetFont_beforePlaceholder() {
        self.textView.font = UIFont.systemFont(ofSize: 34)
        self.textView.placeholder = "Hello"
        XCTAssertEqual(self.textView.placeholderLabel.text, "Hello")
        XCTAssertEqual(self.textView.placeholderLabel.font, UIFont.systemFont(ofSize: 34))
    }

    func testSetFont_afterPlaceholder() {
        self.textView.placeholder = "Hello"
        self.textView.font = UIFont.systemFont(ofSize: 34)
        XCTAssertEqual(self.textView.placeholderLabel.text, "Hello")
        XCTAssertEqual(self.textView.placeholderLabel.font, UIFont.systemFont(ofSize: 34))
    }

    func testSetFont_beforeAttributedPlaceholder() {
        let attributedPlaceholder = attributedString("Hello", .bold(26))
        self.textView.font = UIFont.systemFont(ofSize: 34)
        self.textView.attributedPlaceholder = attributedPlaceholder
        XCTAssertEqual(self.textView.attributedPlaceholder, attributedPlaceholder)
    }

    func testSetFont_afterAttributedPlaceholderFont() {
        let attributedPlaceholder = attributedString("Hello", .bold(26))
        self.textView.attributedPlaceholder = attributedPlaceholder
        self.textView.font = UIFont.systemFont(ofSize: 34)
        XCTAssertEqual(self.textView.attributedPlaceholder, attributedString("Hello", .normal(34)))
    }

}
