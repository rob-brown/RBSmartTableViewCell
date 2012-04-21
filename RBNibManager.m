//
// RBNibManager.m
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

#import "RBNibManager.h"

/// A default instance that acts like a singleton. 
static RBNibManager * _defaultManager = nil;


@interface RBNibManager ()

@property (nonatomic, strong) NSMutableDictionary * registeredNibs;

@end


@implementation RBNibManager

@synthesize registeredNibs = _registeredNibs;

- (id)init {

	if ((self = [super init])) {
		[self setRegisteredNibs:[NSMutableDictionary dictionary]];
	}
	
	return self;
}

- (UINib *)nibRegisteredForKey:(NSString *)key {
    
    UINib * nib = nil;
    
    @synchronized([self registeredNibs]) {
        nib = [[self registeredNibs] valueForKey:key];
    }
    
    return nib;
}

- (void)registerNib:(UINib *)nib forKey:(NSString *)key {
    
    NSParameterAssert(nib && key);
    
    @synchronized([self registeredNibs]) {
        [[self registeredNibs] setValue:nib forKey:key];
    }
}

- (void)deregisterKey:(NSString *)key {
    
    NSParameterAssert(key);
    
    @synchronized([self registeredNibs]) {
        [[self registeredNibs] setValue:nil forKey:key];
    }
}


#pragma mark - Singleton methods

+ (RBNibManager *)defaultManager {
    
    @synchronized(self) {
        
        if (!_defaultManager) {
            _defaultManager = [self new];
        }
    }
    
    return _defaultManager;
}

@end
