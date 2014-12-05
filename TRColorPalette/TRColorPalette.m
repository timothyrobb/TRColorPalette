//
//  TRColorPalette.m
//  TRColorPalette
//
//  Created by Timothy Robb on 05/12/2014.
//  Copyright (c) 2014 timothyrobb. All rights reserved.
//

#import "TRColorPalette.h"

@interface TRColorPalette ()

@property (nonatomic, strong, readwrite) NSBundle *bundle;

@end

@implementation TRColorPalette

static TRColorPalette *_sharedPlugin;

+(void)pluginDidLoad:(NSBundle *)plugin {
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            _sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

+(instancetype)sharedPlugin {
    return _sharedPlugin;
}

-(id)initWithBundle:(NSBundle *)plugin {
    if (self = [super init]) {
        self.bundle = plugin;
        
        // Create menu items, initialize UI, etc.

        // Sample Menu Item:
        NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Do Action" action:@selector(doMenuAction) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Sample Action, for menu item:
-(void)doMenuAction {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Hello, World"];
    [alert runModal];
}

@end
