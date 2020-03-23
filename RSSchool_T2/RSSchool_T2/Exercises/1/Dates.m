#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSString *dateString = [[NSString alloc] initWithFormat:@"%@-%@-%@", day, month, year];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    if (!date) {
        return @"Такого дня не существует";
    }
            
    NSDateFormatter * finalFormatter =  [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    [finalFormatter setLocale:locale];
    [finalFormatter setDateFormat:@"dd MMMM, EEEE"];
    NSString *finalString = [finalFormatter stringFromDate: date];
    [finalString lowercaseString];
    return finalString;
}
@end
