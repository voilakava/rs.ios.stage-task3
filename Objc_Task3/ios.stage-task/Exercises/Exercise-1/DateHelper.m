#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) { return nil; }
    NSString *curretMonth = [[NSDateFormatter new] monthSymbols][monthNumber - 1];
    return curretMonth;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[formatter dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"EE";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    NSString *day = [dateFormatter stringFromDate:date];
    return day;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDay = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    NSDateComponents *givenDate = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];
    
    return (currentDay.year == givenDate.year) && (currentDay.weekOfYear == givenDate.weekOfYear);
}

@end
