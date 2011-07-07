A simple line graph for iOS.

Simply add the TFLineGraph header and implementation files to your project, import the header files into your view controller and set up the colors and data. 

Examples below show how to do this using interface builder and without.

Using Code:
-----------------
TFLineGraph *drawingView = [[TFLineGraph alloc] initWithFrame:CGRectMake(100, 100, 250, 250)]; //position graph
    drawingView.backgroundColor = [UIColor blackColor]; //set bg color
    drawingView.lineColor = [UIColor colorWithRed:1 green:0 blue:.2 alpha:1]; //set line color
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    tempArray = [NSMutableArray arrayWithObjects:@"20",@"30",@"15",@"45",@"20",@"40",@"30",@"25",@"55",nil]; //set data
    drawingView.graphDataSet = tempArray;
    [tempArray release];
    [self.view addSubview:drawingView]; //add view
    [drawingView release];


Using IB:
-----------------
Declare the graph view in the .h file and synthesise it in the .m

self.graphView.lineColor = [UIColor colorWithRed:.7 green:.8 blue:1 alpha:1]; //set line color
    self.graphView.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1]; //set bg color
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    tempArray = [NSMutableArray arrayWithObjects:@"20",@"40",@"30",@"25",@"5",nil]; //set data
    self.graphView.graphDataSet = temp2Array;
    [tempArray release];

-----------------
info@timfazio.com