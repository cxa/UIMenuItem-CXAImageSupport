# UIMenuItem with Image Support

![Image item screenshot](https://raw.github.com/cxa/UIMenuItem-CXAImageSupport/master/screenshot.jpg)

`UIMenuItem` uses `UILabel` to display its title, that means we can swizzle `-drawTextInRect:` to support image.

`UIMenuItem+CXAImageSupport` is a dirty hack but should be safe in most cases.

Make a category instead of subclassing `UIMenuItem` gains more flexibility. Yes, I mean you can add image to awsome [PSMenuItem](https://github.com/steipete/PSMenuItem) too!

## How to use

Add `UIMenuItem+CXAImageSupport.{h,m}` to your project.

The method names describe all. Default draws shadow as the text title. If you want to hide shadow, set `hidesShadow` to `YES`. 

	- (id)cxa_initWithTitle:(NSString *)title action:(SEL)action image:(UIImage *)image;
	- (id)cxa_initWithTitle:(NSString *)title action:(SEL)action image:(UIImage *)image hidesShadow:(BOOL)hidesShadow;
	- (void)cxa_setImage:(UIImage *)image forTitle:(NSString *)title;
	- (void)cxa_setImage:(UIImage *)image hidesShadow:(BOOL)hidesShadow forTitle:(NSString *)title;
	
## Limitation

`UIMenuItem+CXAImageSupport` uses `UIMenuItem`'s title to map related image since there is no any other clue of `UIMenuItem` I can find to connect to `UILabel`.

## Creator

* GitHub: <https://github.com/cxa>
* Twitter: [@_cxa](https://twitter.com/_cxa)
* Apps available in App Store: <http://lazyapps.com>

## License

Under the MIT license. See the LICENSE file for more information.
