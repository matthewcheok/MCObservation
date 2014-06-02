//
//  UIViewController+MCObservation.h
//  Pods
//
//  Created by Matthew Cheok on 2/6/14.
//
//

#import <UIKit/UIKit.h> 

typedef void (^MCKeyboardShowAnimationBlock)(CGRect keyboardFrame);
typedef void (^MCKeyboardHideAnimationBlock)(CGRect keyboardFrame);

@interface UIView (MCObservation)

+ (void)animateWithKeyboardNotification:(NSNotification *)notification delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

@end

@interface UIViewController (MCObservation)

- (void)mc_animateAlongsideKeyboardWithShowAnimations:(MCKeyboardShowAnimationBlock)showAnimationBlock andHideAnimations:(MCKeyboardHideAnimationBlock)hideAnimationBlock;
- (void)mc_removeKeyboardAnimations;

@end
