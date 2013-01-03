# UIMenuItem with Image Support

![Image item screenshot](/cxa/CXAImageMenuItem/raw/screenshot.jpg)

`UIMenuItem` uses `UILabel` to display its title, that means we can swizzle `-drawTextInRect:` to support image.

`CXAImageMenuItem` category for `UIMenuItem` is a dirty hack but safe in most cases.

## How to use

Only two methods. Name describes all.

	- (id)cxa_initWithTitle:(NSString *)title action:(SEL)action image:(UIImage *)image;
	- (void)cxa_setImage:(UIImage *)image forTitle:(NSString *)title;
	
## Limitation

`CXAImageMenuItem` uses `UIMenuItem`'s title to map related image since there is no any other clue of `UIMenuItem` I can find to connect to `UILabel`.

## Creator

* GitHub: [CHEN Xian'an](https://github.com/cxa/)
* Twitter: [@_cxa](https://twitter.com/_cxa)

## License

Under the MIT license. See the LICENSE file for more information.
