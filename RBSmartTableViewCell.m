//
// RBSmartTableViewCell.m
//
// Copyright (c) 2012 Robert Brown
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "RBSmartTableViewCell.h"
#import "RBNibManager.h"

const CGFloat kStandardCellHeight = 44.0f;


@implementation RBSmartTableViewCell

@synthesize accessoryButton = _accessoryButton;
@synthesize accessoryBlock  = _accessoryBlock;


#pragma mark - Cell production methods

+ (UINib *)nib {
    
    RBNibManager * nibManager = [RBNibManager defaultManager];
    UINib * nib = [nibManager nibRegisteredForKey:[self nibKey]];
    
    if (!nib) {
        
        NSBundle * bundle = [NSBundle bundleForClass:[self class]];
        
        // -nibWithName:bundle: always returns a UINib object even if the 
        // nib doesn't exist. So, we make that check.
        NSString * path = [bundle pathForResource:[self nibKey] 
                                           ofType:@"nib"];
        if (path)
            nib = [UINib nibWithNibName:[self nibName] bundle:bundle];
        
        if (nib)
            [nibManager registerNib:nib forKey:[self nibKey]];
    }
    
    return nib;
}

+ (NSString *)nibName {
    return [self cellIdentifier];
}

+ (NSString *)nibKey {
    return [self nibName];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

+ (UITableViewCellStyle)cellStyle {
    return UITableViewCellStyleDefault;
}

+ (id)cellForTableView:(UITableView *)tableView {
    return [self cellForTableView:tableView 
                  reuseIdentifier:nil
                          fromNib:nil];
}

+ (id)cellForTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseID {
    return [self cellForTableView:tableView 
                  reuseIdentifier:reuseID
                          fromNib:nil];
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib {
    return [self cellForTableView:tableView 
                  reuseIdentifier:nil
                          fromNib:nib];
}

+ (id)cellForTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseID fromNib:(UINib *)nib {
    
    NSParameterAssert(tableView);
    
    // Guarantees that we have a cell identifier.
    if (!reuseID) reuseID = [self cellIdentifier];
    
    // Dequeues the cell, if any exist. If UIStoryboard is used, then UIKit will 
    // create a new cell at this point.
    id cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    // Creates the cell if one doesn't exist.
    if (!cell) {
        
        // Tries to grab a nib, if it exists. 
        if (!nib) nib = [self nib];
        
        // Creates the cell from the nib.
        NSArray * nibObjects = [nib instantiateWithOwner:nil options:nil];
        
        // Grabs the cell from the inflated nib, if exists.
        if ([nibObjects count] > 0) {
            
            // Sanity check for creation from a nib.
            // Assumes that the first root object is the desired cell.
            NSAssert2(([nibObjects count] > 0 && 
                       [[nibObjects objectAtIndex:0] isKindOfClass:[self class]]),
                      @"Nib '%@' does not appear to contain a valid %@", 
                      [self nibName], 
                      NSStringFromClass([self class]));
            
        	cell = [nibObjects objectAtIndex:0];
        }
        // Otherwise, creates the cell from code if creation from a nib fails.
        // WARNING: This may mask problems with UIStoryboards if cell creation 
        // fails due to an incorrect cell identifier.
        else
        	cell = [[self alloc] initWithStyle:[self cellStyle]
                               reuseIdentifier:reuseID];
    }
    
    return cell;
}


#pragma mark - Accessory button methods

- (IBAction)accessoryButtonTapped:(id)sender event:(id)event {

	RBSmartTableViewCellAccessoryBlock block = [self accessoryBlock];
	
    if (block) block();
}

@end
