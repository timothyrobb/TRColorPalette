//
//  TRColorPalette.h
//  TRColorPalette
//
//  Created by Timothy Robb on 05/12/2014.
//  Copyright (c) 2014 timothyrobb. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface TRColorPalette : NSObject

@property (nonatomic, strong, readonly) NSBundle *bundle;

+(instancetype)sharedPlugin;

@end