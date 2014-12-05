# TRColorPallette

This XCode 6+ plugin was built out of the need to make a named palette of colours, perhaps from a design, to use inside IB without having to constantly share hexcodes around.
It essentially read the named static methods you provide in your UIColor category, and makes those colours available in IB's colour dropdowns.

## Installation

- Install using [Alcatraz](alcatraz.io)

## Usage

1. Add a UIColor category if you haven't already. (e.g. [this article](http://www.synchromation.com/code/files/09bdecaffe9e6329e2011aab1ec97f63-1.html) )
2. Add `IB_DESIGNABLE` to before the `@interface` in your UIColor category's header file.
3. Open IB (either your `.xib` or your `.storyboard`)
4. Select a colour picker, and viola, your colour is available.

## Notes

- This will only detect categories that have the `IB_DESIGNABLE` flagged in the class. This is by design, so you don't fill your palette up too much
- This will only work for any static methods that don't take any parameters and return a UIColor object (i.e. `+(instancetype)magentaColor;` or `+ (UIColor) lightBeigeColor;`
- This will strip off the word `color` or `colour` from the end of the colour's name.
