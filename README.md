# UIMenuItem with Image Support

![screenshot of UIMenuItem with image](https://raw.github.com/cxa/UIMenuItem-CXAImageSupport/master/screenshot.jpg)

`UIMenuItem` uses `UILabel` to display its title, that means we can swizzle `-drawTextInRect:` to support image.

`UIMenuItem+CXAImageSupport` is a dirty hack but should be safe in most cases. Contains no any private APIs and should be safe for App Store.

## How to use

Drag `UIMenuItem+CXAImageSupport.{h,m}` to your project.

The method names describe all. For simple usage, the only step is to set a image to the menu item. For advance usage, config and set a `settings`.

    @class CXAImageMenuSettings;
    
    @interface UIMenuItem (CXAImageSupport)
    
    - (id)cxa_initWithTitle:(NSString *)title action:(SEL)action image:(UIImage *)image;
    - (id)cxa_initWithTitle:(NSString *)title action:(SEL)action settings:(CXAImageMenuSettings *)settings;
    - (void)cxa_setImage:(UIImage *)image;
    - (void)cxa_setSettings:(CXAImageMenuSettings *)settings;
    
    @end
    
    // Uses a settings class instead of NSDictionary to avoid misspelled keys
    @interface CXAImageMenuSettings : NSObject
    
    + (instancetype)settingsWithDictionary:(NSDictionary *)dict;
    
    @property (nonatomic) UIImage *image;
    @property (nonatomic) BOOL shadowDisabled;
    @property (nonatomic) CGFloat shrinkWidth;  // For adjustment item width only, will not be preciouse because menu item will keep its minimun width, it's useful for showing some large amount of menu items without expanding.

    
    @end
    
## Limitation

`UIMenuItem+CXAImageSupport` uses `UIMenuItem`'s title to map related image since there is no any other clue of `UIMenuItem` I can find to connect to `UILabel`. You can't set different images for the same title.

## Creator

* GitHub: <https://github.com/cxa>
* Twitter: [@_cxa](https://twitter.com/_cxa)
* Apps available in App Store: <http://lazyapps.com>

## License

`UIMenuItem+CXAImageSupport` is released under the MIT license. In short, it's royalty-free but you must you keep the copyright notice in your code or software distribution.
