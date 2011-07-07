//
//  TFGraphExampleViewController.m
//  TFGraphExample
//
//  Created by Timothy Fazio on 8/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TFGraphExampleViewController.h"
#import "TFLineGraph.h"

@implementation TFGraphExampleViewController

@synthesize graphView;

- (void)dealloc
{
    [super dealloc];
    [graphView dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Draw from code
    TFLineGraph *drawingView = [[TFLineGraph alloc] initWithFrame:CGRectMake(100, 100, 250, 250)]; //position graph
    drawingView.backgroundColor = [UIColor blackColor]; //set bg color
    drawingView.lineColor = [UIColor colorWithRed:1 green:0 blue:.2 alpha:1]; //set line color
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    tempArray = [NSMutableArray arrayWithObjects:@"20",@"30",@"15",@"45",@"20",@"40",@"30",@"25",@"55",nil]; //set data
    drawingView.graphDataSet = tempArray;
    [tempArray release];
    [self.view addSubview:drawingView]; //add view
    [drawingView release];
    
    //Draw in Interface Builder
    self.graphView.lineColor = [UIColor colorWithRed:.7 green:.8 blue:1 alpha:1]; //set line color
    self.graphView.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1]; //set bg color
    NSMutableArray *temp2Array = [[NSMutableArray alloc] init];
    temp2Array = [NSMutableArray arrayWithObjects:@"20",@"40",@"30",@"25",@"5",nil]; //set data
    self.graphView.graphDataSet = temp2Array;
    [temp2Array release];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end