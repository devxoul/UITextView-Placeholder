UITextView+Placeholder
======================

[![CI](https://github.com/devxoul/UITextView-Placeholder/actions/workflows/ci.yml/badge.svg)](https://github.com/devxoul/UITextView-Placeholder/actions/workflows/ci.yml)
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

- **Import Dynamic Framework**:

    e.g. If you're using CocoaPods with `use_frameworks!` flag.

    ```objc
    @import UITextView_Placeholder;
    ```
    
- **Import Static Library**:

    ```objc
    #import <UITextView+Placeholder/UITextView+Placeholder.h>
    ```

Then create `UITextView` and set `placeholder`.

- **Implement Objective-C**:

    ```objc
    UITextView *textView = [[UITextView alloc] init];
    textView.placeholder = @"How are you?";
    textView.placeholderColor = [UIColor lightGrayColor]; // optional
    textView.attributedPlaceholder = ... // NSAttributedString (optional)
    ```

- **Implement Swift**:

    ```swift
    let textView = UITextView()
    textView.placeholder = "How are you?"
    textView.placeholderColor = UIColor.lightGray // optional
    textView.attributedPlaceholder = ... // NSAttributedString (optional)
    ```

Congratulations! You're done. 🎉


Development
-----------

This project uses [Tuist](https://tuist.io) for project generation.

```bash
# Install Tuist (if not already installed)
curl -Ls https://install.tuist.io | bash

# Generate Xcode project
tuist generate

# Build
tuist build Demo

# Run tests
tuist test

# Run the demo app
tuist run Demo
```


License
-------

UITextView+Placeholder is under MIT license. See the [LICENSE](LICENSE) file for more information.
