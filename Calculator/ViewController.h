//
//  ViewController.h
//  Calculator
//
//  Created on 1/15/15.
//  Copyright (c) 2015 CMPE161. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "Calculator+ExtraFunctionality.h"

@interface ViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic) Calculator *myCalculator;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UILabel *userHistory;


@end

