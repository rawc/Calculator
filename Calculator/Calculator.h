//
//  Calculator.h
//  Calculator
//
//  Created on 1/15/15.
//  Copyright (c) 2015 CMPE161. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef Calculator_Calculator_h
#define Calculator_Calculator_h
@interface Calculator : NSObject

//Property declarations
@property NSMutableArray* numbers;
@property NSMutableArray* operationStack;
@property NSMutableString* userInput;






//Method declarations
-(id)init;
-(void)clear;
-(NSNumber*)add:(NSNumber*)num1 to:(NSNumber*)num2;
-(NSNumber*)sub:(NSNumber*)num1 to:(NSNumber*)num2;
-(NSNumber*)mult:(NSNumber*)num1 to:(NSNumber*)num2;
-(NSNumber*)div:(NSNumber*)num1 to:(NSNumber*)num2;






@end
#endif
