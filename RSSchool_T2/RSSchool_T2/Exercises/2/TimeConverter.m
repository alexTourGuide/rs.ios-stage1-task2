#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    if ([hours intValue] < 0 | [hours intValue] > 24 | [minutes intValue] > 59 | [minutes intValue] < 0) {
        return @"";
    }
    
    NSDictionary *hDict = @{
        @"0" : @"",
        @"1" : @"one",
        @"2" : @"two",
        @"3" : @"three",
        @"4" : @"four",
        @"5" : @"five",
        @"6" : @"six",
        @"7" : @"seven",
        @"8" : @"eight",
        @"9" : @"nine",
        @"10" : @"ten",
        @"11" : @"eleven",
        @"12" : @"tvelve"
    };
    
    NSDictionary *minDict = @{
        @"01" : @"one minute",
        @"02" : @"two minutes",
        @"03" : @"three minutes",
        @"04" : @"four minutes",
        @"05" : @"five minutes",
        @"11" : @"eleven minutes",
        @"15" : @"quarter",
        @"30" : @"half",
        @"38" : @"twenty two minutes",
        @"45" : @"quarter",
        @"58" : @"two minutes",
        @"15" : @"quarter",
    };
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"tvelve", nil];
    
    NSString *hourStringTo =  [arr objectAtIndex:([hours intValue] + 1)];
    NSString *hourString = [hDict objectForKey:hours];
    NSString *minutesString = [minDict objectForKey:minutes];
    
    if ([minutes isEqualToString: @"00"]) {
        return [NSString stringWithFormat:@"%@ o' clock", hourString];
    }
    if ([minutes intValue] <= 30) {
        return [NSString stringWithFormat:@"%@ past %@", minutesString, hourString];
    }
    if ([minutes intValue] < 60) {
        return [NSString stringWithFormat:@"%@ to %@", minutesString, hourStringTo];
    }
    return @"";
}
@end
