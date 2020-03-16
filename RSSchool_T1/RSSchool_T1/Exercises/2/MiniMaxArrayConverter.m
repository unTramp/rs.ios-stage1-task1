#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray<NSNumber*>* inputArray = array.mutableCopy;
    NSArray<NSNumber*>* resultArray = [[NSArray alloc] init];
    NSMutableArray<NSNumber*>* summArray = [[NSMutableArray alloc] init];
    NSInteger summ = 0;
    
    for (NSInteger i=0; i<array.count; i++) {
        [inputArray removeObjectAtIndex:i];
        for (NSNumber* each in inputArray) {
            summ += each.integerValue;
        }
        
        [summArray addObject:[NSNumber numberWithInteger:summ]];
        summ = 0;
        
        inputArray = array.mutableCopy;
    }
    
    NSNumber* min = [summArray valueForKeyPath:@"@min.self"];
    NSNumber* max = [summArray valueForKeyPath:@"@max.self"];
    
    resultArray = [NSArray arrayWithObjects:min, max, nil];
    
    return resultArray;
}

@end
