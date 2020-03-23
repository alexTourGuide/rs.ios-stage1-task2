#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    // is Pangram?
    __block NSString *lowercaseString = [self lowercaseString];
    NSString *str = @"abcdefghijklmnopqrstuvwxyz";
    __block BOOL isPangram = YES;
    [str enumerateSubstringsInRange:NSMakeRange(0, str.length)
                            options:NSStringEnumerationByComposedCharacterSequences
                         usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (![lowercaseString containsString:substring]) {
            isPangram = NO;
            *stop = YES;
        }
    }];
    
    NSArray *wordsAll = [self componentsSeparatedByString:@" "];
    NSMutableArray *words = [wordsAll mutableCopy];
    [words removeObject:@""];
    NSMutableArray *arrayOne = [[NSMutableArray alloc] init];
    NSMutableArray *arrayTwo = [[NSMutableArray alloc] init];
    NSMutableArray *arrayThree = [[NSMutableArray alloc] init];
    NSMutableArray *arrayFour = [[NSMutableArray alloc] init];
    NSMutableArray *arrayFive = [[NSMutableArray alloc] init];
    NSMutableArray *arraySix = [[NSMutableArray alloc] init];
    NSMutableArray *arraySeven = [[NSMutableArray alloc] init];
    NSMutableArray *arrayEight = [[NSMutableArray alloc] init];
    NSMutableArray *arrayNine = [[NSMutableArray alloc] init];
    NSMutableArray *totalArray = [[NSMutableArray alloc] init];
    NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];
    NSString *pattern = [[NSString alloc] init];
    NSString *pattern_low = [[NSString alloc] init];
    
     for (NSString* word in words) {
         if (isPangram) {
             pattern = @"a|A|e|E|o|O|i|I|u|U|y|Y";
             pattern_low = @"(a|e|o|i|u|y)";
             [characterSet addCharactersInString:@"aeoiuy"];
         } else {
             pattern = @"(b|B|c|C|d|D|f|F|g|G|h|H|j|J|k|K|l|L|m|M|n|N|p|P|q|Q|r|R|s|S|t|T|v|V|w|W|x|X|z|Z)";
             pattern_low = @"(b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|z)";
             [characterSet addCharactersInString:@"bcdfgjhklmnpqrstvwxz"];
         }
     NSError  *error = nil;
     NSRegularExpression* findLetters = [NSRegularExpression regularExpressionWithPattern: pattern
                                                                                  options:0
                                                                                    error:&error];

     NSUInteger numberOfMatches = [findLetters numberOfMatchesInString:word
                                                               options:0
                                                                 range:NSMakeRange(0, [word length])];
     NSString *numberOfMatchString = [[NSString alloc] initWithFormat:@"%lu", (unsigned long)numberOfMatches];
     NSMutableString *countPlusWord = [numberOfMatchString mutableCopy];
     [countPlusWord appendString:word];
         
         //найдем все маленькие буквы
             NSRegularExpression* findLowLetters = [NSRegularExpression regularExpressionWithPattern: pattern_low options:0 error:&error];
                
             NSUInteger numberOfMatches_low = [findLowLetters numberOfMatchesInString:countPlusWord
                                                                         options:0
                                                                           range:NSMakeRange(0, [countPlusWord length])];
         // заменяем маленькие буквы
         for (NSUInteger i = 0; i < numberOfMatches_low; i++) {
             NSRange rangeOfVowel = [countPlusWord rangeOfCharacterFromSet:characterSet];
             NSString *bigLetter = [[countPlusWord substringWithRange:rangeOfVowel] uppercaseString];
             [countPlusWord replaceCharactersInRange:rangeOfVowel withString:bigLetter];
         }
         
         if (numberOfMatches == 0) {
             [totalArray addObject:countPlusWord];
         } else if (numberOfMatches == 1) {
             [arrayOne addObject:countPlusWord];
         } else if (numberOfMatches == 2) {
             [arrayTwo addObject:countPlusWord];
         } else if (numberOfMatches == 3) {
             [arrayThree addObject:countPlusWord];
         } else if (numberOfMatches == 4) {
             [arrayFour addObject:countPlusWord];
         } else if (numberOfMatches == 5) {
             [arrayFive addObject:countPlusWord];
         } else if (numberOfMatches == 6) {
             [arraySix addObject:countPlusWord];
         } else if (numberOfMatches == 7) {
             [arraySeven addObject:countPlusWord];
         } else if (numberOfMatches == 8) {
             [arrayEight addObject:countPlusWord];
         } else if (numberOfMatches == 9) {
             [arrayNine addObject:countPlusWord];
         }
     }
     [totalArray addObjectsFromArray:arrayOne];
     [totalArray addObjectsFromArray:arrayTwo];
     [totalArray addObjectsFromArray:arrayThree];
     [totalArray addObjectsFromArray:arrayFour];
     [totalArray addObjectsFromArray:arrayFive];
     [totalArray addObjectsFromArray:arraySix];
     [totalArray addObjectsFromArray:arraySeven];
     [totalArray addObjectsFromArray:arrayEight];
     [totalArray addObjectsFromArray:arrayNine];
     
     NSString * result = [[totalArray valueForKey:@"description"] componentsJoinedByString:@" "];
     
     return result;
}

@end
