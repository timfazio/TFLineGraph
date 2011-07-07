//
//  TFLineGraph.m
//  MyGraph
//
//  Created by Timothy Fazio on 7/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TFLineGraph.h"

@implementation TFLineGraph


@synthesize graphDataSet;
@synthesize lineColor;

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"init");
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"init");
        
        // Set up defaults
        self.backgroundColor = [UIColor lightGrayColor];
        self.lineColor = [UIColor darkGrayColor];
        
        /*
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        self.graphDataSet = tempArray;
        [tempArray release];
        */
    }
    return self;
}

-(void)setUpSampleData {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    tempArray = [NSMutableArray arrayWithObjects:@"5",@"10",@"15",@"7",@"20",@"10",nil];
    self.graphDataSet = tempArray;
    [tempArray release];
}
/*
-(void)newGraphForData:(NSMutableArray *)dataArray withLineColor:(UIColor *)lineColor andLineWidth:(NSNumber *)lineWidth andBackgroundColor:(UIColor *)bgColor andPadding:(NSNumber *)padding {
    
    NSArray *keysArray = [[NSArray alloc] initWithObjects:@"dataArray", @"lineColor", @"lineWidth", @"bgColor", @"padding", nil];
    NSArray *objectsArray = [[NSArray alloc] initWithObjects:dataArray, lineColor, lineWidth, bgColor, padding, nil];
    
    NSDictionary *tempDict = [[NSDictionary alloc] initWithObjects:objectsArray forKeys:keysArray];
    NSLog(@"precount: %u",[self.graphDataSet count]);
    NSLog(@"ret count: %u",[self.graphDataSet retainCount]);
    //[self.graphDataSet retain];
    [self.graphDataSet addObject:tempDict];
    NSLog(@"postcount: %u",[self.graphDataSet count]);
    
    for (id thing in [self.graphDataSet objectAtIndex:0]) {
        NSLog(@"%@",thing);
    }
    [objectsArray release];
    [keysArray release];
    [tempDict release];
    NSLog(@"ret count: %u",[self.graphDataSet retainCount]);
}
*/

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int lineWidth = 10;
    //set up context
	CGContextRef context = UIGraphicsGetCurrentContext();
    
	//set up sample data set
    //[self setUpSampleData];
    
    //set up view variables (could incorporate padding here?)
    float xMin = 0;
    float xMax = self.bounds.size.width;
    float yMin = 0;
    float yMax = self.bounds.size.height;
    //float padding = 1; //in fraction of whole units
    float maxValue = 0; //then get max with for loop:
    
    for (id value in self.graphDataSet) {
        if ([value intValue]>maxValue) {
            maxValue = [value intValue];
        }
    }
    
    int numValues = [self.graphDataSet count];
    
    //set up grid properties
	CGContextSetLineWidth(context, 3); //makes it visible, sets width
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:.5].CGColor);
    CGContextSetLineCap(context, kCGLineCapButt); //make it square
	
    int numberOfGridLines = 10;
    //Add grid
    for (int i=0; i<(numberOfGridLines+1); i++) {
        //vetical
        CGContextMoveToPoint(context, (xMax/numberOfGridLines)*i, yMin);
        CGContextAddLineToPoint(context, (xMax/numberOfGridLines)*i, yMax);
        CGContextStrokePath(context);
        
        
        //horizontal
        CGContextMoveToPoint(context, xMin, (yMax/numberOfGridLines)*i);
        CGContextAddLineToPoint(context, xMax, (yMax/numberOfGridLines)*i);
        CGContextStrokePath(context);
    }
    
    
    
    //Add lines
    CGContextSetLineWidth(context, lineWidth); //makes it visible, sets width
	CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetLineCap(context, kCGLineCapRound); //make it rounded
	
    for (int i=1; i<numValues; i++) {
        float currentX = (([[self.graphDataSet objectAtIndex:i] intValue])/maxValue)*xMax;
        float currentY = (yMax/(numValues-1))*i;
        float previousX = ([[self.graphDataSet objectAtIndex:i-1] intValue]/maxValue)*xMax;
        float previousY = (yMax/(numValues-1))*(i-1);
        
        NSLog(@"curX:%f, curY:%f, prevX:%f, prevY:%f", currentX, currentY, previousX, previousY);
        CGContextMoveToPoint(context, previousX, previousY);
        CGContextAddLineToPoint(context, currentX, currentY);
        CGContextStrokePath(context);
    }
    
    

}
- (void)dealloc
{
    NSLog(@"dealloc");
    [super dealloc];
    [lineColor release];
    [graphDataSet release];
}

@end
