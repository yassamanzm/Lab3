//
//  ViewController2.h
//  Math Quiz
//
//  Created by Yassaman ZandMoghaddam on 2016-12-10.
//  Copyright © 2016 Yassaman ZandMoghaddam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {ADDITION, SUBTRACTION, PRODUCTION} QuizType;

@interface ViewController2 : UIViewController {
    
    IBOutlet UILabel *questionNumber;
    IBOutlet UILabel *remainingTime;
    
    IBOutlet UILabel *operand1;
    IBOutlet UILabel *operand2;
    IBOutlet UILabel *result;
    IBOutlet UILabel *operation;
}

 @property(nonatomic) QuizType qType;

- (IBAction)buttonClicked:(id)keyTitle;

- (void) generateQuestion;

@end
