//
//  ViewController2.m
//  Math Quiz
//
//  Created by Yassaman ZandMoghaddam on 2016-12-10.
//  Copyright © 2016 Yassaman ZandMoghaddam. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

// private methods
- (int)randomNumberGenerator;
- (void)setOperationIcon;
- (bool)validateInput: (NSString*)inputStr;

@end

@implementation ViewController2
{
    int counter;
    int totalNumberOfCorrectAnswers;
    int expectedResult;
    NSString *resultStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set title
    [self setViewTitle];
    
    // Do any additional setup after loading the view.
    
    // initialize global variables
    counter = 0;
    totalNumberOfCorrectAnswers = 0;
    
    /*Yassaman: for test*/
//    qType = PRODUCTION;
    
    [self setOperationIcon];
    
    [self generateQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)keyTitle {
    NSLog(@"Button pressed: %@", [keyTitle currentTitle]);
    
    if ([[keyTitle currentTitle]  isEqual: @"Enter"]) {
            NSLog(@"Enter");
        [self generateQuestion];
    } else if ([[keyTitle currentTitle]  isEqual: @"C"]) {
        NSLog(@"C");
        result.text = @"";
        resultStr = @"";
    } else {
        NSLog(@"%@", [keyTitle currentTitle]);
        resultStr = [resultStr stringByAppendingString:[keyTitle currentTitle]]; //append the entered number
        result.text = [NSString stringWithFormat: @"%@", resultStr];
        
        // validate result string
        [self validateInput:resultStr];
    }
}

- (void) generateQuestion {
    
    counter = counter + 1;
    resultStr = @"";
    result.text = [NSString stringWithFormat: @"%@", resultStr];
    
    if ( counter == 11) {
        // end of quiz, show the dialog
        counter = 0;
        return;
    }
    
    questionNumber.text = [NSString stringWithFormat: @"%i", counter];
    
    int num1 = [self randomNumberGenerator];
    int num2 = [self randomNumberGenerator];
    
    if (_qType == ADDITION) {
        expectedResult = num1 + num2;
        operand1.text = [NSString stringWithFormat: @"%i", num1];
        operand2.text = [NSString stringWithFormat: @"%i", num2];
        
    } else if (_qType == PRODUCTION) {
        expectedResult = num1 * num2;
        operand1.text = [NSString stringWithFormat: @"%i", num1];
        operand2.text = [NSString stringWithFormat: @"%i", num2];
    } else {    // subtraction, avoid negative results
    
        if (num1 >= num2) {
            expectedResult = num1 - num2;
            operand1.text = [NSString stringWithFormat: @"%i", num1];
            operand2.text = [NSString stringWithFormat: @"%i", num2];
        } else {
            expectedResult = num2 - num1;
            operand1.text = [NSString stringWithFormat: @"%i", num2];
            operand2.text = [NSString stringWithFormat: @"%i", num1];
        }
    }
}

- (int)randomNumberGenerator {
    int num = arc4random() % 10;
    return num;
}

- (void)setOperationIcon {
    if (_qType == ADDITION) {
        operation.text = @"+";
    } else if (_qType == PRODUCTION) {
        operation.text = @"\u00D7";
    } else {    // subtraction
        operation.text = @"\u2212";
    }
}

- (void)setViewTitle {
    if (_qType == ADDITION) {
        self.navigationItem.title = @"Adition";
    } else if (_qType == PRODUCTION) {
        self.navigationItem.title = @"Production";
    } else {    // subtraction
        self.navigationItem.title = @"Subtraction";
    }
}

- (bool)validateInput: (NSString*)inputStr {
    NSInteger inputInt = [inputStr integerValue];
    if (expectedResult == inputInt) {
        NSLog(@"true");
        totalNumberOfCorrectAnswers ++;
        [self generateQuestion];
        return true;
    }
    NSLog(@"false");
    return false;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
