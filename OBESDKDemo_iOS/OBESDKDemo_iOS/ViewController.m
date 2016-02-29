//
//  ViewController.m
//  OBESDKDemo_iOS
//
//  Created by Henry Serrano on 2/26/16.
//  Copyright © 2016 Machina Wearable Technology SAPI de CV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    obe = [[OBE alloc] initWithDelegate:self];
    //obe = [[OBE alloc] init];
    
    //[obe setDelegate:self];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //[obe startScanning];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [obe disconnectFromOBE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark OBEDelegate

- (void) onOBEFound:(NSString *)name Index:(int)index{
    NSLog(@"OBE Found: %@", name);
    
    // connect upon discovering first OBE
    [obe connectToOBE:index];
}

- (void) onOBEConnected:(NSString *)name{
    NSLog(@"Connected to: %@", name);
}

- (void) onOBEDisconnected:(NSString *)name{
    NSLog(@"Disconnected from: %@", name);
}

- (void) onQuaternionUpdated:(int) identifier W:(float)w X:(float)x Y:(float)y Z:(float)z{
    NSLog(@"%i, %f, %f, %f, %f", identifier, w, x, y, z);
}

#pragma mark IBFunctions

-(IBAction)search:(id)sender{
    //obe = [[OBE alloc] init];
    //[obe setDelegate:self];
    
    [obe startScanning];
    
    NSLog(@"Scan started");
}

@end