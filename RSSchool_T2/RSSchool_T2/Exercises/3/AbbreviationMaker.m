#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSMutableString *mutA = [a mutableCopy];
    
    for (NSUInteger i = 0; i < [mutA length]; i++) {
        if (i < [b length]) {
        NSRange range = NSMakeRange(i, 1);
        NSString *letterA = [mutA substringWithRange:range];
        NSString *letterAMut = [letterA capitalizedString];
        NSString *letterB = [b substringWithRange:range];
            if (![letterA isEqualToString:letterB]) {
                [mutA replaceOccurrencesOfString:letterA
                                      withString:letterAMut
                                         options:0
                                           range:NSMakeRange(i, 1)];
                if (![letterAMut isEqualToString:letterB]) {
                    [mutA deleteCharactersInRange:NSMakeRange(i, 1)];
                    i--;
                }
            }
        } else {
        [mutA deleteCharactersInRange:NSMakeRange(i, 1)];
        }
    }
    
    if ([mutA isEqualToString:b]) {
        return @"YES";
    } else {
        return @"NO";
    }
}
@end
