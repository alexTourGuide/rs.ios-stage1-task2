#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSNumber *isEqual = @0;
    NSNumber *one;
    NSNumber *two;
    NSMutableArray *fibonacciSeries = [NSMutableArray new];
    [fibonacciSeries addObject:@0];
    int total = 0;
    int prev = 1;
    for (int i = 1; i < number.intValue; i++){
        total = total + prev;
        prev = total - prev;
        [fibonacciSeries addObject:[NSNumber numberWithInt:total]];
    }
    for (int i = 0; i < (fibonacciSeries.count - 1); i++) {
        NSNumber *first = [fibonacciSeries objectAtIndex:i];
        NSNumber *next = [fibonacciSeries objectAtIndex:i+1];
        if ((first.intValue * next.intValue) == number.intValue) {
            isEqual = @1;
            one = first;
            two = next;
            break;
        } else if ((first.intValue * next.intValue) > number.intValue) {
            one = first;
            two = next;
            break;
        }
    }
        
    return [[NSArray alloc] initWithObjects:one, two, isEqual, nil];
}
@end
