#import "PalindromeSolver.h"

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableArray* myArray = [[NSMutableArray alloc] init];
    NSInteger count = 0;
    NSInteger previousMax = 0;
        
    for (NSInteger index = 0; index < s.length; index++) {
        NSString* myString = [s substringWithRange:NSMakeRange(index, 1)];
        [myArray addObject:myString];
    }

    for (NSInteger index = (n.integerValue / 2); index >= 0; index -= 1) {
        NSInteger lElement = [[myArray objectAtIndex: index] integerValue];
        NSInteger rElement = [[myArray objectAtIndex: (n.integerValue - index - 1) ] integerValue];
        if (lElement != rElement) {
            previousMax = MAX(previousMax, MAX(lElement, rElement));
            myArray[index] = [NSString stringWithFormat:@"%ld", previousMax];
            myArray[(n.integerValue - index - 1)] = [NSString stringWithFormat:@"%ld", previousMax];
            if (lElement != previousMax) {
                count += 1;
            }
            if (rElement != previousMax) {
                count += 1;
            }
        }
    }
    if (count == k.integerValue) {
        return [myArray componentsJoinedByString:@""];
    } else {
        return @"-1";
    }
}

@end
