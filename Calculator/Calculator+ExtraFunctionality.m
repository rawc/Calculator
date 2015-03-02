//
//  Calculator+ExtraFunctionality.m
//  Calculator
//
//  Created on 1/15/15.
//  Copyright (c) 2015 CMPE161. All rights reserved.
//

#import "Calculator+ExtraFunctionality.h"



@implementation Calculator (ExtraFunctionality)
//Example of separating components of a string


-(BOOL) validOperation:(NSString*) userInput {
    NSMutableArray* operations = [[NSMutableArray alloc]init];
    [operations addObject:@"+"];
    [operations addObject:@"-"];
    [operations addObject:@"/"];
    [operations addObject:@"*"];
    BOOL valid = false;
    for (NSString* tmp in operations) {
        if([tmp isEqualToString:userInput]){
            valid = true;
        }
    }
    
    return valid;
}

@end
