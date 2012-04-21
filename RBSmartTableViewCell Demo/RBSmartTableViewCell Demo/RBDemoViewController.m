//
//  RBDemoViewController.m
//  RBSmartTableViewCell Demo
//
//  Copyright (c) 2012 Robert Brown
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RBDemoViewController.h"
#import "RBPerson.h"


@interface RBDemoViewController ()

@property (nonatomic, strong, readwrite) IBOutlet UITableView * tableView;
@property (nonatomic, copy, readwrite) NSArray * people;

- (void)setupDemo;

@end


@implementation RBDemoViewController

@synthesize tableView = _tableView;
@synthesize people    = _people;

- (void)setupDemo {
    self.people = [NSArray arrayWithObjects:
                   [RBPerson personWithName:@"Billy" age:23],
                   [RBPerson personWithName:@"Timmy" age:19],
                   [RBPerson personWithName:@"Sally" age:22],
                   [RBPerson personWithName:@"Bobby" age:99],
                   nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![self people])
        [self setPeople:[NSArray array]];
    
    [self setupDemo];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self people] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
