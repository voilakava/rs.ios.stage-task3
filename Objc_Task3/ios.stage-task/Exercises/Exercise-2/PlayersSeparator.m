	#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int count = 0;
    BOOL IbiggerThanJ, IlessThanJ, JlessThanK, sort, JbiggerThanK, sortedDescending;
    
    for (int i = 0; i < ratingArray.count; ++i) {
        for (int j = i + 1; j < ratingArray.count; ++j) {
            for (int k = j + 1; k < ratingArray.count; ++k) {
                JlessThanK = [ratingArray[j] intValue] < [ratingArray[k] intValue];
                IlessThanJ = [ratingArray[i] intValue] < [ratingArray[j] intValue];
                JbiggerThanK = [ratingArray[j] intValue] > [ratingArray[k] intValue];
                IbiggerThanJ = [ratingArray[i] intValue] > [ratingArray[j] intValue];
                
                sort = IlessThanJ && JlessThanK;
                sortedDescending = IbiggerThanJ && JbiggerThanK;
                
                // MARK: count
                if (sort || sortedDescending){
                    count++;
                }
            }
        }
    }
    return count;
}

@end
