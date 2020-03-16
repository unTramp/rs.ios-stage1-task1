#import "BillCounter.h"

@implementation BillCounter

- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSString* result = @"Bon Appetit";
    NSInteger finishCost = 0;

    for (NSNumber *cost in bill) {
      finishCost += [cost intValue];
    }
    finishCost -= bill[index].integerValue;
    
    NSInteger moneyBack = sum.integerValue - (finishCost/2);
    
    if ((finishCost/2) != sum.integerValue) {
        return [NSString stringWithFormat:@"%ld", moneyBack];
    }

    return result;

}

@end
