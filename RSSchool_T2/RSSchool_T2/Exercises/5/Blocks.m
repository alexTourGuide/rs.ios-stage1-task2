#import "Blocks.h"


@interface Blocks ()

@property (nonatomic, copy) NSArray *arrayA;
@property (nonatomic, copy) Class class;

@end


@implementation Blocks

// An arrayA of different objects is passed to the blockA
- (BlockA)blockA {
    return [^(NSArray *array) {
        self->_arrayA = [array copy];
    } copy];
}

// The blockB is passed the classC of the object (from blockA) with which to work.
- (BlockB)blockB {
    return [^(Class class) {
        self->_class = class;
        NSMutableArray *mutableArray = [[self arrayA] mutableCopy];
        // 1. in case of class is NSNumber - sum of numbers
        if (class == [NSNumber class]) {
            NSInteger sum = 0;
            for (NSObject *oneNumber in [self arrayA]) {
                if ([oneNumber isKindOfClass:class]) {
                    sum += [(NSNumber *)oneNumber intValue];
                }
            }
            self.blockC([[NSNumber alloc] initWithInteger:sum]);
        // 2. in case of class is NSString - concatenation of all strings
        } else if (class == [NSString class]) {
            NSString *concatenation = @"";
            for (NSObject *oneWord in mutableArray) {
                if ([oneWord isKindOfClass:class]) {
                    concatenation = [concatenation stringByAppendingString:(NSString *)oneWord];
                }
            }
            self.blockC(concatenation);
        // 3. in case of date-format - the latest date as a string in the format dd.MM.yyyy
        } else {
            NSTimeInterval latestInterv = 0;
            for (NSObject *oneDate in [self arrayA]) {
                if ([oneDate isKindOfClass:class]) {
                    NSTimeInterval someTimeInterv = [(NSDate *)oneDate timeIntervalSince1970];
                    if (someTimeInterv > latestInterv) {
                        latestInterv = someTimeInterv;
                    }
                }
            }
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            self.blockC([dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970: latestInterv]]);
        }
    }copy];
}

@end


