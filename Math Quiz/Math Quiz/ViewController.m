//
//  ViewController.m
//  Math Quiz
//
//  Created by Yassaman ZandMoghaddam on 2016-12-09.
//  Copyright © 2016 Yassaman ZandMoghaddam. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// http://stackoverflow.com/questions/7864371/how-to-pass-prepareforsegue-an-object

-(void)prepareForSegue:(UIStoryboardSegue *)segue getQType:(id)buttonType{
    
    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
    ViewController2 *controller = (ViewController2 *)navController.topViewController;
    
    if([segue.identifier isEqualToString:@"addition"]){
        controller.qType = ADDITION;
    } else if([segue.identifier isEqualToString:@"subtraction"]){
        controller.qType = SUBTRACTION;
    } else if([segue.identifier isEqualToString:@"production"]){
        controller.qType = PRODUCTION;
    }
}

@end
