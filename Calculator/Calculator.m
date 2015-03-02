//
//  Calculator.m
//  Calculator
//
//  Created on 1/15/15.
//  Copyright (c) 2015 CMPE161. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Calculator+ExtraFunctionality.h"

#import "Calculator.h"

@implementation Calculator

//Method implementations defined here

//Overriding init to initialize variables
-(id) init{
    self = [super init];
    
    if (self) {
        _userInput = [[NSMutableString alloc] init];
        _numbers = [[NSMutableArray alloc]init];
        _operationStack = [[NSMutableArray alloc]init];
        //Initialize other @property variables here
        
    }
    return self;
}

//Clear variables
-(void)clear {
    [_numbers removeAllObjects];
    [_operationStack removeAllObjects];
    NSLog(@"%@",@"Calculator mem cleared.");
}
-(NSNumber*)add:(NSNumber*)num1 to:(NSNumber*)num2{
    NSNumber *sum = @([num1 doubleValue] + [num2 doubleValue]);
    return sum;
}
-(NSNumber*)sub:(NSNumber*)num1 to:(NSNumber*)num2{
    NSNumber *sum = @([num1 doubleValue] - [num2 doubleValue]);
    return sum;
}
-(NSNumber*)mult:(NSNumber*)num1 to:(NSNumber*)num2{
    NSNumber *sum = @([num1 doubleValue] * [num2 doubleValue]);
    return sum;
}
-(NSNumber*)div:(NSNumber*)num1 to:(NSNumber*)num2{
    NSNumber *sum = @([num1 doubleValue] / [num2 doubleValue]);
    return sum;
}

@end
