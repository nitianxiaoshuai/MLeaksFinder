//
//  MLeaksMessenger.m
//  MLeaksFinder
//
//  Created by 佘泽坡 on 7/17/16.
//  Copyright © 2016 zeposhe. All rights reserved.
//

#import "MLeaksMessenger.h"
#import <UIKit/UIKit.h>

@implementation MLeaksMessenger

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    [self alertWithTitle:title message:message delegate:nil additionalButtonTitle:nil];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
              delegate:(id)delegate
 additionalButtonTitle:(NSString *)additionalButtonTitle {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *topVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (topVC.presentedViewController) {
            topVC = topVC.presentedViewController;
        }
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [alertController addAction:okAction];
        
        if (additionalButtonTitle) {
            UIAlertAction *additionalAction = [UIAlertAction actionWithTitle:additionalButtonTitle
                                                                       style:UIAlertActionStyleDefault
                                                                     handler:nil];
            [alertController addAction:additionalAction];
        }
        
        [topVC presentViewController:alertController animated:YES completion:nil];
    });
    
    NSLog(@"%@: %@", title, message);
}

@end
