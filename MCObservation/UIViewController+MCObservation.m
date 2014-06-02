//
//  UIViewController+MCObservation.m
//  Pods
//
//  Created by Matthew Cheok on 2/6/14.
//
//

#import "UIViewController+MCObservation.h"
#import "MCNotificationObserver.h"

#import <objc/runtime.h>

@implementation UIView (MCObservation)

+ (void)animateWithKeyboardNotification:(NSNotification *)notification delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion {
	NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;

	[UIView animateWithDuration:duration delay:0 options:options | option animations:animations completion:completion];
}

@end

@implementation UIViewController (MCObservation)

#pragma mark - Properties

- (NSMutableArray *)mc_keyboardObservers {
	NSMutableArray *array = objc_getAssociatedObject(self, @selector(mc_keyboardObservers));
	if (!array) {
		array = [NSMutableArray array];
		objc_setAssociatedObject(self, @selector(mc_keyboardObservers), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return array;
}

#pragma mark - Methods

- (void)mc_animateAlongsideKeyboardWithShowAnimations:(MCKeyboardShowAnimationBlock)showAnimationBlock andHideAnimations:(MCKeyboardHideAnimationBlock)hideAnimationBlock {
	MCNotificationObserver *showObserver = [[MCNotificationObserver alloc] initWithNotificationName:UIKeyboardWillShowNotification notificationBlock: ^(NSNotification *notification) {
	    CGRect frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	    CGRect keyboardFrame = [self.view convertRect:frame fromView:[[UIApplication sharedApplication] delegate].window];

	    [UIView animateWithKeyboardNotification:notification delay:0 options:0 animations: ^{
	        showAnimationBlock(keyboardFrame);
		} completion:nil];
	}];

	MCNotificationObserver *hideObserver = [[MCNotificationObserver alloc] initWithNotificationName:UIKeyboardWillHideNotification notificationBlock: ^(NSNotification *notification) {
	    CGRect frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	    CGRect keyboardFrame = [self.view convertRect:frame fromView:[[UIApplication sharedApplication] delegate].window];

	    [UIView animateWithKeyboardNotification:notification delay:0 options:0 animations: ^{
	        hideAnimationBlock(keyboardFrame);
		} completion:nil];
	}];
    
    NSMutableArray *array = [self mc_keyboardObservers];
    [array addObjectsFromArray:@[showObserver, hideObserver]];
}

- (void)mc_removeKeyboardAnimations {
    NSMutableArray *array = [self mc_keyboardObservers];
    [array removeAllObjects];
}

@end
