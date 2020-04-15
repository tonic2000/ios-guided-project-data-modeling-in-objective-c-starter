//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"
#import "LSIFirstResponder.h"
// if Error : 'LSILog.h' file not found
// Sometimes in Xcode 11, the complier won't see our files if they are in folders
// Command + Shift + K : Clean
// Build: Command + B
// Build Unit Test: Command + Shift + U

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Hey clean output!");

}


@end
