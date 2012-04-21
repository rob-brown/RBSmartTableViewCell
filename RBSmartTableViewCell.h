//
// RBSmartTableViewCell.h
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

#import <UIKit/UIKit.h>

extern const CGFloat kStandardCellHeight;

typedef void(^RBSmartTableViewCellAccessoryBlock)();

/**
 * An Interface Builder-compliant, customizable UITableViewCell. 
 * RBSmartTableViewCell should be subclassed rather than used directly. To 
 * create a new subclass, follow these steps:
 *
 * 1. Create a class for your custom cell (i.e. <Prefix><Name>Cell.m and 
 * <Prefix><Name>Cell.h).
 * 2. Create a XIB for your custom cell (i.e. <Prefix><Name>Cell.xib). The name 
 * must match the class.
 * 3. In your header file, subclass RBSmartTableViewCell.
 * 4. In your XIB, customize the cell as desired. You must have a UITableViewCell 
 * as the root (and probably only) UI element in Interface Builder.
 * 5. In your XIB, set the Cell Identifier in the Attributes Inspector (must be 
 * the same as the name of the class). 
 * 6. In your XIB, set the custom class in the Identity Inspector.
 * 7. Add the necessary IBOutlets to your class. This must be done manually. Be 
 * sure to include @synthesize and -dealloc.
 * 8. Connect the XIB to the class. Connections must be made to the UITableViewCell 
 * object in the left-hand view hierarchy window rather than "File's Owner." The 
 * cell has no owner.
 * 9. (Optional but recommended) In your header and implementation files, add a 
 * designated customizer method. For example -setupWithPerson:(Person*)aPerson;. 
 * This should set up the cell's subviews with the given parameter(s). 
 *
 * In order to get an RBSmartTableViewCell subclass, use +cellForTableView: and 
 * pass in the table view you are going to put the cell in. From there, you can 
 * customize the cell by using it's designated customizer method, if any, or by 
 * modifying its IBOutlets directly.
 *
 * If you use a customizer method, then your -tableView:cellForRowAtIndexPath: 
 * method should look something like this:
 *
 * - (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 * 
 *     RBPersonCell * cell = [RBPersonCell cellForTableView:aTableView];
 *     Person * person = (Person *)[self personForRowAtIndexPath:indexPath];
 *     [cell setupCellWithPerson:person];
 *     
 *     return cell;
 * }
 */
@interface RBSmartTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIButton * accessoryButton;
@property (nonatomic, copy) RBSmartTableViewCellAccessoryBlock accessoryBlock;

/**
 * The default nib to use for this class. Uses -nibName to find the nib.
 *
 * @returns nil if the nib doesn't exist. Otherwise, returns a UINib object. 
 */
+ (UINib *)nib;

/**
 * The default nib name to use for this class.
 */
+ (NSString *)nibName;

/**
 * The default nib key to use for this class. The nib key is needed for use in 
 * RBNibManager.
 */
+ (NSString *)nibKey;

/**
 * The default reuse ID to use for this class.
 */
+ (NSString *)cellIdentifier;

/**
 * The default cell style to use if this cell is built using code. 
 */
+ (UITableViewCellStyle)cellStyle;

/**
 * Convenience method for +cellForTableView:reuseIdentifier:fromNib:. Passes nil 
 * for the parameters not included in this method. This is generally the 
 * preferred method to call, so the any UINib handling or reuse identifiers are
 * abstracted into the cell's code. 
 */
+ (id)cellForTableView:(UITableView *)tableView;

/**
 * Convenience method for +cellForTableView:reuseIdentifier:fromNib:. Passes nil 
 * for the parameters not included in this method.
 */
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib;

/**
 * Convenience method for +cellForTableView:reuseIdentifier:fromNib:. Passes nil 
 * for the parameters not included in this method.
 */
+ (id)cellForTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseID;

/**
 * Creates a smart table view cell given the various parameters. You may have 
 * more than one reuseID that maps to one nib, but you MUST NOT have more than 
 * one nib map to the same reuseID.
 *
 * @param tableView (Required) The tableview to use for cell reuse.
 * @param reuseID (Optional) The reuse ID to use for cell reuse. Uses 
 * -cellIdentifier if nil is given.
 * @param nib (Optional) The nib to create the cell from. Uses -nib if nil is 
 * given.
 *
 * @return A new or reused cell of this class's or subclass's type.
 */
+ (id)cellForTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseID fromNib:(UINib *)nib;

/**
 * An action that can be connected to using Interface Builder. This is used to 
 * handle any actions associated with tapping the cell's accessory button. By 
 * default, this calls the cell's accessoryBlock.
 */
- (IBAction)accessoryButtonTapped:(id)sender event:(id)event;

@end
