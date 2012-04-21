#RBSmartTableViewCell

##Summary

Producing custom table view cells can be tedious, error-prone work. `RBSmartTableViewCell` is an Interface Builder-compliant, customizable UITableViewCell designed to take the pain out of the process by:

1. Encapsulating automatic cell reuse.

2. Encapsulating custom cell production. Cells constructed using UIStoryboard, XIBs, or straight code are all treated the same. 

3. Handle nib management (if applicable). 

The design is based on recipes 15-16 from [iOS Recipes][1]. 

##Dependencies

`RBSmartTableViewCell` requires UIKit and runs on iOS 4.0+. 

##How to use

Using `RBSmartTableViewCell` is a two-step process. First, creating a custom cell through subclassing. Second, using the cell in your table view code. 

###Creating custom cells

`RBSmartTableViewCell` should be subclassed rather than used directly. To 
create a new subclass, follow these steps:

1. Create a class for your custom cell (ex. <#Prefix#><#Name#>Cell.m and <#Prefix#><#Name#>Cell.h).
2. If using XIBs, create a XIB for your custom cell (ex. <#Prefix#><#Name#>Cell.xib). The name must match the class name.
3. In your header file, subclass `RBSmartTableViewCell`.
4. In your XIB or `UIStoryboard`, customize the cell as desired. If using a XIB, you must have a `UITableViewCell` as the first root (and probably only) UI element in Interface Builder.
5. In your XIB or `UIStoryboard`, set the Cell Identifier in the Attributes Inspector (must be the same as the name of the class). 
6. In the Identity Inspector of your XIB or `UIStoryboard`, set the custom class to your new class.
7. Add the necessary IBOutlets to your class. Be sure to include `@synthesize` and `-dealloc` (if not using ARC).
8. Connect the XIB or `UIStoryboard` to the class. Connections must be made to the `UITableViewCell` object in the left-hand view hierarchy window rather than "File's Owner." Cells have no owner.
9. (Optional but recommended) In your header and implementation files, add a designated setup method. For example `-setupWithPerson:(Person *)aPerson;`. This method should set up the cell's subviews with the given parameter(s). 

###Using custom cells

In order to get an `RBSmartTableViewCell` subclass, use `+cellForTableView:` and 
pass in the table view you are going to put the cell in. From there, you can 
customize the cell by using it's designated customizer method, if any, or by 
modifying its IBOutlets directly.

If you use a setup method, then your `-tableView:cellForRowAtIndexPath:` 
method should look something like this:

```objective-c
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    RBPersonCell * cell = [RBPersonCell cellForTableView:aTableView];
    Person * person = (Person *)[self personForRowAtIndexPath:indexPath];
    [cell setupCellWithPerson:person];
    
    return cell;
}
```

As you can see from the above code snippet, `RBSmartTableViewCell`s can be created and set up for use in as little as three to four lines of code. This is possible because all the production code has been abstracted away into the cell itself.

##Extras

I have included some `RBSmartTableViewCell` subclasses for samples and for use as is. Since these classes are generic, they do not have a designated setup methods. They are also created from XIBs, so they do not have an `-init` method either. These provided table view cells may be used to replace the standard `UITableViewCell`s.

##License

`RBSmartTableViewCell` is licensed under the MIT license, which is reproduced in its entirety here:

>Copyright (c) 2012 Robert Brown
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in
>all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>THE SOFTWARE.

  [1]: http://pragprog.com/book/cdirec/ios-recipes
