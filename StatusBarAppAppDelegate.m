//
//  StatusBarAppAppDelegate.m
//  StatusBarApp
//
//  Created by Aravindkumar Rajendiran on 10-04-17.
//  Copyright 2010 Grapewave. All rights reserved.
//

#import "StatusBarAppAppDelegate.h"
#import <AppKit/NSPasteboard.h>
//#import "NSP"

@implementation StatusBarAppAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

-(void)awakeFromNib{
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    [statusItem setMenu:statusMenu];

//    NSPasteboard *pasteboard = [NSPasteboard pasteboardWithUniqueName];
//    NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
//    NSDictionary *options = [NSDictionary dictionary];
//    NSArray *copiedItems = [pasteboard readObjectsForClasses:classes options:options];
//    if (copiedItems != nil) {
//        // Do something with the contents...
//    }
    
    
//    NSPasteboard *pasteboard = [NSPasteboard pasteboardWithUniqueName];
//    NSDictionary *options = [NSDictionary dictionary];
//    NSArray *classes;
//    
//    classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
//    NSArray *strings = [pasteboard readObjectsForClasses:classes options:options];
//    if (strings != nil) {
//        // Do something with the strings...
//    }
//    
//    classes = [[NSArray alloc] initWithObjects:[NSAttributedString class], nil];
//    NSArray *attributedStrings = [pasteboard readObjectsForClasses:classes options:options];
//    if (copiedItems != nil) {
//        // Do something with the attributed strings...
//
//    }
//    NSPasteboard *pasteboard = [NSPasteboard pasteboardWithUniqueName];
//    
//                                NSArray *classes = [[NSArray alloc] initWithObjects:[NSString class], nil];
//    NSDictionary *options = [NSDictionary dictionary];
//    NSArray *copiedItems = [pasteboard readObjectsForClasses:classes options:options];
//    if (copiedItems != nil) {
//        
//    }
//
//    dispatch_async(dispatch_async(dispatch_queue_t queue, <#^(void)block#>), <#^(void)block#>)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        while (1) {
            sleep(1);
            NSString *str = [[NSPasteboard generalPasteboard] stringForType:NSPasteboardTypeString];
            if (str.length >= 5) {
                str = [str substringToIndex:5];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [statusItem setTitle:str];
            });
        }
    });
    [statusItem setHighlightMode:YES];
}

- (IBAction)about:(id)sender {
}

@end
