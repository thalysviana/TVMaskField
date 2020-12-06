# TVMaskField

[![Build Status](https://travis-ci.com/thalysviana/TVMaskField.svg?branch=main)](https://travis-ci.com/thalysviana/TVMaskField)
[![Version](https://img.shields.io/cocoapods/v/TVMaskField.svg?style=flat)](https://cocoapods.org/pods/TVMaskField)
[![License](https://img.shields.io/cocoapods/l/TVMaskField.svg?style=flat)](https://cocoapods.org/pods/TVMaskField)
[![Platform](https://img.shields.io/cocoapods/p/TVMaskField.svg?style=flat)](https://cocoapods.org/pods/TVMaskField)

```TVMaskfield``` allows you to mask your textfield by simply setting a string mask to it.

There are three existing types for mask characters. Combine one or more of them to create the mask. The mask characters are the following:

- ```0``` for numbers
- ```A``` for letters
- ```*``` for alphanumeric

## Usage

### Interface Builder

Define your textfield class to ```TVMaskTextField``` in the identity inspector and set your mask in attributes inspector.

![](https://i.imgur.com/Y86garO.png)

![](https://i.imgur.com/u4gordY.png)

### Code

Define the mask by setting up the textMask property of the ```TVMaskTextField```.

```maskTextField.textMask = "0000 0000 0000 0000"```

## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

TVMaskField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TVMaskField'
```

## Example

![Alt Text](https://media.giphy.com/media/3JG8rKl0kBfmpiguNa/giphy.gif)

## Author

Thalys Viana

## License

TVMaskField is available under the MIT license. See the LICENSE file for more info.
