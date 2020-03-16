#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray* happyArray = sadArray.mutableCopy;
    
    if (sadArray.count >= 3) {
        for (NSInteger i = 1; i < happyArray.count - 1; i++) {
            NSInteger leftNumber = [happyArray[i-1] integerValue];
            NSInteger currentNumber = [happyArray[i] integerValue];
            NSInteger rightNumber = [happyArray[i+1] integerValue];
            if (leftNumber + rightNumber < currentNumber) {
                [happyArray removeObjectAtIndex:i];
                i = 1;
            }
        }
        return happyArray;
    }
    
    return sadArray;
}

@end
