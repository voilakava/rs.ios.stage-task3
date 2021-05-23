#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSString *mutableString1 = [NSMutableString stringWithString:string1];
    NSString *mutableString2 = [NSMutableString stringWithString:string2];
    NSMutableString *result = [NSMutableString new];
    
    while ((mutableString1.length) && (mutableString2.length)) {
        [mutableString1 characterAtIndex:0];
        
        if ([mutableString1 UTF8String][0] <= [mutableString2 UTF8String][0]) {
            [result appendFormat:@"%c", [mutableString1 characterAtIndex:0]];
            mutableString1 = [mutableString1 substringFromIndex: 1];
        } else {
            [result appendFormat:@"%c", [mutableString2 characterAtIndex:0]];
            mutableString2 = [mutableString2 substringFromIndex: 1];
        }
    }
    
    if ([mutableString1 length]){
        [result appendString: mutableString1];
    } else {
        [result appendString: mutableString2];
    }
    
    return result;
}

@end
