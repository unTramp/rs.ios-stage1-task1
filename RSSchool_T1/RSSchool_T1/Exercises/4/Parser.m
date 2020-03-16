#import "Parser.h"

@implementation Parser

- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray<NSString *> *result = [[NSMutableArray alloc] init];
    NSDictionary *pareBrackets = @{ @"[": @"]", @"(": @")", @"<": @">" };
    NSInteger count = string.length;
     for (NSInteger i = 0; i < count; i++) {
         unichar character = [string characterAtIndex:i];
         if (character == '[' || character == '(' || character == '<') {
             NSMutableString *newString = [[NSMutableString alloc]init];
             NSInteger j = i + 1;
             NSInteger omit = 0;
             unichar nextSymbol = [string characterAtIndex:i + 1];
             NSString *openBracket = [NSString stringWithCharacters:&character length:1];
             unichar closeBracket = [pareBrackets[openBracket] characterAtIndex:0];
             while (nextSymbol != closeBracket) {
                 [newString appendFormat:@"%C", nextSymbol];
                 nextSymbol = [string characterAtIndex:j += 1];
                 if (nextSymbol == character)
                     omit += 1;
                 if (nextSymbol == closeBracket && omit) {
                     [newString appendFormat:@"%C", nextSymbol];
                     nextSymbol = [string characterAtIndex:j += 1];
                     omit -= 1;
                 }
             }
             [result addObject:newString];
         }
     }
    return result;
}

@end
