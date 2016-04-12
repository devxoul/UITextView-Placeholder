UITextView+Placeholder
======================

[![Build Status](https://travis-ci.org/devxoul/UITextView-Placeholder.svg?branch=master)](https://travis-ci.org/devxoul/UITextView-Placeholder)
[![CocoaPods](http://img.shields.io/cocoapods/v/UITextView+Placeholder.svg?style=flat)](http://cocoapods.org/?q=name%3AUITextView%2BPlaceholder)

A missing placeholder for UITextView.


Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UITextView+Placeholder'
```


Usage
-----

Create `UITextView`, then set `placeholder`.

```objc
UITextView *textView = [[UITextView alloc] init];
textView.placeholder = @"How are you?";
textView.placeholderColor = [UIColor lightGrayColor]; // optional
```

Congratulations! You're done.

--

Since 1.1.0 you can use `attributedPlaceholder`.

```objc
textView.attributedPlaceholder = ... // NSAttributedString
```


License
-------

UITextView+Placeholder is under MIT license. See LICENSE for more information.
