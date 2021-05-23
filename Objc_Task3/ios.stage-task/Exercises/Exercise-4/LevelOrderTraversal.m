#import "LevelOrderTraversal.h"

@interface Node : NSObject
 
@property NSNumber *num;
@property Node *leftSide;
@property Node *rightSide;
 
- (Node *)initWithValue:(NSNumber *)value;
- (Node *)getTreeFromPreorder:(NSArray *) preorder;
- (NSMutableArray *)getLevelTraversal;
 
@end

@implementation Node
 
- (Node *)initWithValue:(NSNumber *)value {
 
    self = [super init];
    if (self != nil) {
        self.num = value;
        self.leftSide = NULL;
        self.rightSide = NULL;
    }
    return self;
}

- (Node *)getTreeFromPreorder:(NSArray *)preorder {
    if ([preorder count] <= GlobalIndex || preorder[GlobalIndex] == [NSNull null]) {
        return nil;
    }
    
    Node *root = [[Node alloc] initWithValue: preorder[GlobalIndex]];
    
    if (([preorder count] - 1) == GlobalIndex) {
        return root;
    }
    
    GlobalIndex++;
    root.leftSide = [[Node alloc] getTreeFromPreorder: preorder];
    
    GlobalIndex++;
    root.rightSide = [[Node alloc] getTreeFromPreorder: preorder];
    
    return root;
}

- (NSMutableArray *)getLevelTraversal {
    
    NSMutableArray *traversal = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.num, nil], nil];
        
    if (self.leftSide != nil) {
        NSArray *left = self.leftSide.getLevelTraversal;
        for (int i = 0; i < left.count; ++i) {
            if (i < traversal.count - 1) {
                [traversal[i + 1] addObjectsFromArray:left[i]];
            } else {
                [traversal addObject: left[i]];
            }
        }
    }
    
    if (self.rightSide != nil) {
        NSArray *right = self.rightSide.getLevelTraversal;
        for (int i = 0; i < right.count; ++i) {
            if (i < traversal.count - 1) {
                [traversal[i + 1] addObjectsFromArray:right[i]];
            } else {
                [traversal addObject: right[i]];
            }
        }
    }
    
    return traversal;
}
 
@end

int GlobalIndex = 0;

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    GlobalIndex = 0;
    //using block getTreeFromPreorder
    Node *restoredTree = [[Node alloc] getTreeFromPreorder:tree];
    
    //Check for nil
    //using block getLevelTraversal
    
    if (restoredTree) {
        return [restoredTree getLevelTraversal];
    } else {
        return @[];
    }
}
