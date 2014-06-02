MCObservation ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)
=============

[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/MCObservation/badge.png)](https://github.com/matthewcheok/MCObservation)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/MCObservation/badge.svg)](https://github.com/matthewcheok/MCObservation)

Easy-to-use, fire-and-forget KVO and notifications.

## Installation

Add the following to your [CocoaPods](http://cocoapods.org/) Podfile

    pod 'MCObservation', '~> 1.0'

or clone as a git submodule,

or just copy files in the ```MCObservation``` folder into your project.

## Using MCObservation

### Observing changes to models

Make your view objects observe your models for changes:

    - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
      self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
          [self mc_observeKeyPath:@"object.title" withBlock: ^(NSString *keyPath, NSDictionary *change) {
          self.textLabel.text = self.object.title;
        }];
      }
      return self;
    }

### Keyboard Animations

You can configure `velocity`, `springBounciness` and `springSpeed`.

    [self mc_animateAlongsideKeyboardWithShowAnimations: ^(CGRect keyboardFrame) {
        self.textField.backgroundColor = [UIColor colorWithRed:1.000 green:0.231 blue:0.188 alpha:0.5];
    } andHideAnimations: ^(CGRect keyboardFrame) {
        self.textField.backgroundColor = nil;
    }];

There is no need to unregister any notifications.

## License

MCObservation is under the MIT license.
