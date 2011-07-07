//
//  TFLineGraph.h
//  MyGraph
//
//  Created by Timothy Fazio on 7/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TFLineGraph : UIView {
    NSMutableArray *graphDataSet;
    UIColor *lineColor;
}

@property (nonatomic, retain) NSMutableArray *graphDataSet;
@property (nonatomic, retain) UIColor *lineColor;



//-(void)newGraphForData:(NSMutableArray *)dataArray withLineColor:(UIColor *)lineColor andLineWidth:(NSNumber *)lineWidth andBackgroundColor:(UIColor *)bgColor andPadding:(NSNumber *)padding;
//-(void)drawGraphFromDictionary:(NSDictionary *)graphDict;
@end
