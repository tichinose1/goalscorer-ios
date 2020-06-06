# goalscorer-ios

[![Build Status](https://app.bitrise.io/app/15e8208909829c68/status.svg?token=zFJF9CjxK4YmX18n6KwqkQ&branch=master)](https://app.bitrise.io/app/15e8208909829c68)

Simple viewer for football records and statistics

![screenshot](images/screenshot@0.4x.png)

<div>
  <a href="https://itunes.apple.com/us/app/id1448027447"><img src="https://linkmaker.itunes.apple.com/en-us/badge-lrg.svg?kind=iossoftware"></img></a>
</div>

## Requirement

- Xcode 10.1
- Ruby
  - bundler
- Carthage

## Installation

### Dependencies

```bash
bundle
bundle exec pod install
carthage bootstrap --platform iOS
```

### Firebase

1. Create a Firebase project.
2. Download `GoogleService-info.plist`.

