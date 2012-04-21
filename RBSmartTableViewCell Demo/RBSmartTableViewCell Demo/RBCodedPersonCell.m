//
//  RBCodedPersonCell.m
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

#import "RBCodedPersonCell.h"
#import "RBPerson.h"


@interface RBCodedPersonCell ()

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * ageLabel;

@end


@implementation RBCodedPersonCell

@synthesize nameLabel = _nameLabel;
@synthesize ageLabel  = _ageLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 12.0f, 230.0f, 21.0f)];
        self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(258.0f, 11.0f, 42.0f, 21.0f)];
        [self.ageLabel setTextAlignment:UITextAlignmentRight];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.ageLabel];
    }
    
    return self;
}

- (void)setupWithPerson:(RBPerson *)person {
    [[self nameLabel] setText:[person name]];
    [[self ageLabel] setText:[NSString stringWithFormat:@"%u", [person age]]];
}

@end
