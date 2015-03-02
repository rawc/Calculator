//
//  ViewController.m
//  Calculator
//
//  Created on 1/15/15.
//  Copyright (c) 2015 CMPE161. All rights reserved.
//

#import "ViewController.h"
#import "Calculator+ExtraFunctionality.h"
@interface ViewController ()
- (IBAction)numberOneButton:(UIButton *)sender;
- (IBAction)numberTwoButton:(UIButton *)sender;
- (IBAction)numberThreeButton:(UIButton *)sender;
- (IBAction)numberFourButton:(UIButton *)sender;
- (IBAction)numberFiveButton:(UIButton *)sender;
- (IBAction)numberSixButton:(UIButton *)sender;
- (IBAction)numberSevenButton:(UIButton *)sender;
- (IBAction)numberEightButton:(UIButton *)sender;
- (IBAction)numberNineButton:(UIButton *)sender;
- (IBAction)numberZeroButton:(UIButton *)sender;
- (IBAction)clearButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;
- (IBAction)subButton:(UIButton *)sender;
- (IBAction)multButton:(UIButton *)sender;
- (IBAction)divButton:(UIButton *)sender;
- (IBAction)equalsButton:(UIButton *)sender;
- (IBAction)sqRootButton:(UIButton *)sender;
- (IBAction)cosButton:(UIButton *)sender;
- (IBAction)dotButton:(UIButton *)sender;
- (IBAction)negationButton:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myCalculator = [[Calculator alloc] init];
    
    [_myCalculator clear];
    self.userTextField.delegate = self;
    self.userHistory.text = @" ";
    
}

//Take focus away from the TextField so the keyboard is dismissed when the user presses return or go
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == _userTextField) {
        
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry"
      
                                                              message:@"In this mode you must enter three numbers and valid operations. Also make sure to enter a space after each number"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        
        
        [_userTextField resignFirstResponder];
        
    }
    return YES;
}

// Dismiss the keyboard when the view outside the text field or keyboard is touched
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_userTextField resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}
//----------------------------------------------------------------------------------------------------


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberOneButton:(UIButton *)sender {
    NSString *one = @"1";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:one];
}


- (IBAction)numberTwoButton:(UIButton *)sender {
    NSString *two = @"2";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:two];
}

- (IBAction)numberThreeButton:(UIButton *)sender {
    NSString *three = @"3";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:three];

}

- (IBAction)numberFourButton:(UIButton *)sender {
    NSString *four = @"4";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:four];

}

- (IBAction)numberFiveButton:(UIButton *)sender {
    NSString *five = @"5";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:five];

}

- (IBAction)numberSixButton:(UIButton *)sender {
    NSString *six = @"6";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:six];

}

- (IBAction)numberSevenButton:(UIButton *)sender {
    NSString *seven = @"7";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:seven];

}

- (IBAction)numberEightButton:(UIButton *)sender {
    NSString *eight = @"8";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:eight];

}

- (IBAction)numberNineButton:(UIButton *)sender {
    NSString *nine = @"9";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:nine];

}

- (IBAction)numberZeroButton:(UIButton *)sender {
    NSString *zero = @"0";
    self.userTextField.text = [self.userTextField.text stringByAppendingString:zero];

}

- (IBAction)clearButton:(UIButton *)sender {
    self.userTextField.text = @"";
    [self.myCalculator clear];
    self.userHistory.text = @"";
}

- (IBAction)addButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    [self.myCalculator.numbers addObject:myNum];
    
    [self.myCalculator.operationStack addObject:@"+"];
    //push onto stack
    self.userTextField.text = @"";
    
}

- (IBAction)subButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    [self.myCalculator.numbers addObject:myNum];
    
    [self.myCalculator.operationStack addObject:@"-"];
    //push onto stack
    self.userTextField.text = @"";
}

- (IBAction)multButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    [self.myCalculator.numbers addObject:myNum];
    
    [self.myCalculator.operationStack addObject:@"*"];
    //push onto stack
    self.userTextField.text = @"";
}

- (IBAction)divButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    [self.myCalculator.numbers addObject:myNum];
    
    [self.myCalculator.operationStack addObject:@"/"];
    //push onto stack
    self.userTextField.text = @"";
}

- (IBAction)equalsButton:(UIButton *)sender {

    if([self.myCalculator.numbers count] < 1){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                          message:@"You have only 0 numbers entered"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        return;
    }
    if([self.myCalculator.operationStack count] < 1){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                              message:@"You have only 0 operations entered"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
        [message show];
        return;
    
    }else{
        NSNumber *secondNum = [NSNumber numberWithDouble:[self.userTextField.text doubleValue]];
        self.userTextField.text= @"";
        NSInteger lastObj= [self.myCalculator.numbers count]-1;
        NSNumber *firstNum =[self.myCalculator.numbers objectAtIndex:lastObj];
        [self.myCalculator.numbers removeLastObject];
        lastObj = [self.myCalculator.operationStack count] -1;
        NSString *operation = [self.myCalculator.operationStack objectAtIndex:lastObj];
        [self.myCalculator.operationStack removeLastObject];
        if ([operation isEqualToString:@"+"]){
            NSNumber *sum = [self.myCalculator add:firstNum to: secondNum];
            self.userTextField.text = [NSString stringWithFormat:@"%.2f",sum.doubleValue];
            NSString *historyString =
               [NSString stringWithFormat:@"%@ %@ %@ %@ %@\n", firstNum,@"+",secondNum, @"=", sum];
            NSLog(historyString);
            self.userHistory.text = historyString;
        [self.userHistory.text stringByAppendingString:historyString];
            
        }else if ([operation isEqualToString:@"-"]){
            NSNumber *sum = [self.myCalculator sub:firstNum to: secondNum];
            self.userTextField.text = [NSString stringWithFormat:@"%.2f",sum.doubleValue];
            NSString *historyString =
            [NSString stringWithFormat:@"%@ %@ %@ %@ %@\n", firstNum,@"-",secondNum, @"=", sum];
            self.userHistory.text = historyString;
            [self.userHistory.text stringByAppendingString:historyString];
            
        } else if ([operation isEqualToString:@"*"]){
            NSNumber *sum = [self.myCalculator mult:firstNum to: secondNum];
            self.userTextField.text = [NSString stringWithFormat:@"%.2f",sum.doubleValue];
            NSString *historyString =
            [NSString stringWithFormat:@"%@ %@ %@ %@ %@\n", firstNum,@"*",secondNum, @"=", sum];
            self.userHistory.text = historyString;

            [self.userHistory.text stringByAppendingString:historyString];
            
        }else if ([operation isEqualToString:@"/"]){
            NSNumber *sum = [self.myCalculator div:firstNum to: secondNum];
            self.userTextField.text = [NSString stringWithFormat:@"%.2f",sum.doubleValue];
            NSString *historyString =
            [NSString stringWithFormat:@"%@ %@ %@ %@ %@\n", firstNum,@"/",secondNum, @"=", sum];
            self.userHistory.text = historyString;

            [self.userHistory.text stringByAppendingString:historyString];
            
        }
        NSLog(@"your numbers are %@ and %@", firstNum,secondNum);
    }
}

- (IBAction)sqRootButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    [self.myCalculator.numbers addObject:myNum];
    double sqNum = sqrt([myNum doubleValue]);
    [self.myCalculator.operationStack addObject:@"/"];
    //push onto stack
    self.userTextField.text = [NSString stringWithFormat:@"%.2f", sqNum];
}

- (IBAction)cosButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    [self.myCalculator.numbers addObject:myNum];
    double cosNum = cos([myNum doubleValue]);
    [self.myCalculator.operationStack addObject:@"/"];
    //push onto stack
    self.userTextField.text = [NSString stringWithFormat:@"%.15f", cosNum];
}

- (IBAction)dotButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    tmp = [tmp stringByAppendingString:@"."];
    self.userTextField.text = tmp;
}

- (IBAction)negationButton:(UIButton *)sender {
    NSString *tmp = self.userTextField.text;
    NSNumber  *myNum = [NSNumber numberWithDouble: [tmp doubleValue]];
    NSNumber *sum = @([myNum doubleValue] - 2*[myNum doubleValue]);
    self.userTextField.text = [NSString stringWithFormat:@"%.2f",sum.doubleValue];

    
}
@end
