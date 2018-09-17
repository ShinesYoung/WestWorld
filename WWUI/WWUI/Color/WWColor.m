//
//  WWColor.m
//  WWUI
//
//  Created by Shines Young on 2018/9/11.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWColor.h"


static NSString * const WW_BUNDLE_KEY_COLOR_CONFIG = @"AppColorConfig";

@implementation WWColor

/******************************************************************************/
/**** Utility - Alias Color Declared                                      ****/
/******************************************************************************/
#pragma mark - Utility - Alias Color Declared

+ (UIColor *)importantColor1
{
    static UIColor *colorOfImportant1;
    static dispatch_once_t tokenOfImportant1;
    dispatch_once(&tokenOfImportant1, ^{
        colorOfImportant1 = [WWColor colorWithName:@"important_color_1"];
    });
    return colorOfImportant1;
}

+ (UIColor *)gradientColor1
{
    static UIColor *colorOfGradient1;
    static dispatch_once_t tokenOfGradient1;
    dispatch_once(&tokenOfGradient1, ^{
        colorOfGradient1 = [WWColor colorWithName:@"gradient_color_1"];
    });
    return colorOfGradient1;
}

+ (UIColor *)importantColor2
{
    static UIColor *colorOfImportant2;
    static dispatch_once_t tokenOfImportant2;
    dispatch_once(&tokenOfImportant2, ^{
        colorOfImportant2 = [WWColor colorWithName:@"important_color_2"];
    });
    return colorOfImportant2;
}

+ (UIColor *)importantColor3
{
    static UIColor *colorOfImportant3;
    static dispatch_once_t tokenOfImportant3;
    dispatch_once(&tokenOfImportant3, ^{
        colorOfImportant3 = [WWColor colorWithName:@"important_color_3"];
    });
    return colorOfImportant3;
}

+ (UIColor *)gradientColor3
{
    static UIColor *colorOfGradient3;
    static dispatch_once_t tokenOfGradient3;
    dispatch_once(&tokenOfGradient3, ^{
        colorOfGradient3 = [WWColor colorWithName:@"gradient_color_3"];
    });
    return colorOfGradient3;
}

+ (UIColor *)normalColor1
{
    static UIColor *colorOfNormal1;
    static dispatch_once_t tokenOfNormal1;
    dispatch_once(&tokenOfNormal1, ^{
        colorOfNormal1 = [WWColor colorWithName:@"normal_color_1"];
    });
    return colorOfNormal1;
}

+ (UIColor *)normalColor2
{
    static UIColor *colorOfNormal2;
    static dispatch_once_t tokenOfNormal2;
    dispatch_once(&tokenOfNormal2, ^{
        colorOfNormal2 = [WWColor colorWithName:@"normal_color_2"];
    });
    return colorOfNormal2;
}

+ (UIColor *)weakColor1
{
    static UIColor *colorOfWeak1;
    static dispatch_once_t tokenOfWeak1;
    dispatch_once(&tokenOfWeak1, ^{
        colorOfWeak1 = [WWColor colorWithName:@"weak_color_1"];
    });
    return colorOfWeak1;
}

+ (UIColor *)weakColor2
{
    static UIColor *colorOfWeak2;
    static dispatch_once_t tokenOfWeak2;
    dispatch_once(&tokenOfWeak2, ^{
        colorOfWeak2 = [WWColor colorWithName:@"weak_color_2"];
    });
    return colorOfWeak2;
}

+ (UIColor *)weakColor3
{
    static UIColor *colorOfWeak3;
    static dispatch_once_t tokenOfWeak3;
    dispatch_once(&tokenOfWeak3, ^{
        colorOfWeak3 = [WWColor colorWithName:@"weak_color_3"];
    });
    return colorOfWeak3;
}

+ (UIColor *)weakColor4
{
    static UIColor *colorOfWeak4;
    static dispatch_once_t tokenOfWeak4;
    dispatch_once(&tokenOfWeak4, ^{
        colorOfWeak4 = [WWColor colorWithName:@"weak_color_4"];
    });
    return colorOfWeak4;
}

+ (UIColor *)weakColor5
{
    static UIColor *colorOfWeak5;
    static dispatch_once_t tokenOfWeak5;
    dispatch_once(&tokenOfWeak5, ^{
        colorOfWeak5 = [WWColor colorWithName:@"weak_color_5"];
    });
    return colorOfWeak5;
}

+ (UIColor *)weakColor6
{
    static UIColor *colorOfWeak6;
    static dispatch_once_t tokenOfWeak6;
    dispatch_once(&tokenOfWeak6, ^{
        colorOfWeak6 = [WWColor colorWithName:@"weak_color_6"];
    });
    return colorOfWeak6;
}

+ (UIColor *)otherColor1
{
    static UIColor *colorOfOther1;
    static dispatch_once_t tokenOfOther1;
    dispatch_once(&tokenOfOther1, ^{
        colorOfOther1 = [WWColor colorWithName:@"other_color_1"];
    });
    return colorOfOther1;
}


/******************************************************************************/
/**** Utility - Color With Name                                            ****/
/******************************************************************************/
#pragma mark - Utility - Color With Name

+ (UIColor *)colorWithName:(NSString *)colorName
{
    static NSDictionary *colorConfigDict = nil;
    
    static dispatch_once_t onceTokenOfColorConfig;
    dispatch_once(&onceTokenOfColorConfig, ^{
        NSBundle *mainBundle = [NSBundle mainBundle];
        
        NSString *configFileName
        = [mainBundle.infoDictionary objectForKey:WW_BUNDLE_KEY_COLOR_CONFIG];
        
        NSString *configPath = [mainBundle pathForResource:configFileName
                                                    ofType:nil];
        if (configPath)
        {
            colorConfigDict
            = [NSDictionary dictionaryWithContentsOfFile:configPath];
        }
    });
    
    if (colorConfigDict == nil ||
        [colorConfigDict isKindOfClass:[NSDictionary class]] == NO)
    {
        return nil;
    }
    NSString *hexColor = [colorConfigDict objectForKey:colorName];
    if (hexColor == nil)
    {
        return nil;
    }
    
    return [WWColor colorWithHex:hexColor];
}




/******************************************************************************/
/**** Top & Bottom Line Color                                              ****/
/******************************************************************************/
#pragma mark - Top & Bottom Line Color

+ (UIColor *)topLineColor
{
    static UIColor *topLineColor;
    static dispatch_once_t onceTokenOfTopLineColor;
    dispatch_once(&onceTokenOfTopLineColor, ^{
        topLineColor = [UIColor colorWithRed:172/255.0f
                                       green:172/255.0f
                                        blue:172/255.0f
                                       alpha:1.0];
    });
    return topLineColor;
}

+ (UIColor *)bottomLineColor
{
    static UIColor *bottomLineColor;
    static dispatch_once_t onceTokenOfBottomLineColor;
    dispatch_once(&onceTokenOfBottomLineColor, ^{
        bottomLineColor = [UIColor colorWithRed:172/255.0f
                                          green:172/255.0f
                                           blue:172/255.0f
                                          alpha:1.0];
    });
    return bottomLineColor;
}



/******************************************************************************/
/**** Blue Title Color Series                                              ****/
/******************************************************************************/
#pragma mark - Blue Title Color Series

+ (UIColor *)blueTitleColorForNormal
{
    static UIColor *blueTitleColor4Normal;
    static dispatch_once_t onceTokenOfBlueTitleColor4Normal;
    dispatch_once(&onceTokenOfBlueTitleColor4Normal, ^{
        blueTitleColor4Normal = [UIColor colorWithRed:  0/255.0f
                                                green:122/255.0f
                                                 blue:255/255.0f
                                                alpha:1.0f];
    });
    return blueTitleColor4Normal;
}

+ (UIColor *)blueTitleColorForSelected
{
    static UIColor *blueTitleColor4Selected;
    static dispatch_once_t onceTokenOfBlueTitleColor4Selected;
    dispatch_once(&onceTokenOfBlueTitleColor4Selected, ^{
        blueTitleColor4Selected = [UIColor colorWithRed:  0/255.0f
                                                  green: 60/255.0f
                                                   blue:127/255.0f
                                                  alpha:1.0f];
    });
    return blueTitleColor4Selected;
}

+ (UIColor *)blueTitleColorForDisabled
{
    static UIColor *blueTitleColor4Disabled;
    static dispatch_once_t onceTokenOfBlueTitleColor4Disabled;
    dispatch_once(&onceTokenOfBlueTitleColor4Disabled, ^{
        blueTitleColor4Disabled = [UIColor colorWithRed:127/255.0f
                                                  green:188/255.0f
                                                   blue:255/255.0f
                                                  alpha:1.0f];
    });
    return blueTitleColor4Disabled;
}



/******************************************************************************/
/**** Green Title Color Series                                             ****/
/******************************************************************************/
#pragma mark - Green Title Color Series

+ (UIColor *)greenTitleColor
{
    static UIColor *greenTitleColor4Normal;
    static dispatch_once_t onceTokenOfGreenTitleColor4Normal;
    dispatch_once(&onceTokenOfGreenTitleColor4Normal, ^{
        greenTitleColor4Normal = [UIColor colorWithRed: 48/255.0f
                                                 green:195/255.0f
                                                  blue: 95/255.0f
                                                 alpha:1.0f];
    });
    return greenTitleColor4Normal;
}




/******************************************************************************/
/**** Orange Color Series                                                  ****/
/******************************************************************************/
#pragma mark - Orange Color Series

// #FC7946 -> 252:121:70
+ (UIColor *)orangeColorForNormal
{
    static UIColor *orangeColor4Normal;
    static dispatch_once_t onceTokeOfOrangeColor4Normal;
    dispatch_once(&onceTokeOfOrangeColor4Normal, ^{
        orangeColor4Normal = [UIColor colorWithRed:252/255.0f
                                             green:121/255.0f
                                              blue: 70/255.0f
                                             alpha:1.0f];
    });
    return orangeColor4Normal;
}

// #7E4224 -> 126:66:36
+ (UIColor *)orangeColorForSelected
{
    static UIColor *orangeColor4Selected;
    static dispatch_once_t onceTokeOfOrangeColor4Selected;
    dispatch_once(&onceTokeOfOrangeColor4Selected, ^{
        orangeColor4Selected = [UIColor colorWithRed:126/255.0f
                                               green: 66/255.0f
                                                blue: 36/255.0f
                                               alpha:1.0f];
    });
    return orangeColor4Selected;
}

 // #FEBCA3 -> 254:188:163
+ (UIColor *)orangeColorForDisabled
{
    static UIColor *orangeColor4Disabled;
    static dispatch_once_t onceTokeOfOrangeColor4Disabled;
    dispatch_once(&onceTokeOfOrangeColor4Disabled, ^{
        orangeColor4Disabled = [UIColor colorWithRed:254/255.0f
                                               green:188/255.0f
                                                blue:163/255.0f
                                               alpha:1.0f];
    });
    return orangeColor4Disabled;
}


+ (UIColor *)orangeGradientBeginColorForNormal
{
    static UIColor *orangeGradientBeginColor4Normal;
    static dispatch_once_t onceTokeOfOrangeGradientBeginColor4Normal;
    dispatch_once(&onceTokeOfOrangeGradientBeginColor4Normal, ^{
        orangeGradientBeginColor4Normal = [UIColor colorWithRed:254/255.0f
                                                          green:134/255.0f
                                                           blue: 74/255.0f
                                                          alpha:1.0f];
    });
    return orangeGradientBeginColor4Normal;
}

+ (UIColor *)orangeGradientEndColorForNormal
{
    static UIColor *orangeGradientEndColor4Normal;
    static dispatch_once_t onceTokeOfOrangeGradientEndColor4Normal;
    dispatch_once(&onceTokeOfOrangeGradientEndColor4Normal, ^{
        orangeGradientEndColor4Normal = [UIColor colorWithRed:252/255.0f
                                                        green:121/255.0f
                                                         blue: 70/255.0f
                                                        alpha:1.0f];
    });
    return orangeGradientEndColor4Normal;
}

+ (UIColor *)orangeGradientBeginColorForSelected
{
    static UIColor *orangeGradientBeginColor4Selected;
    static dispatch_once_t onceTokeOfOrangeGradientBeginColor4Selected;
    dispatch_once(&onceTokeOfOrangeGradientBeginColor4Selected, ^{
        orangeGradientBeginColor4Selected = [UIColor colorWithRed:126/255.0f
                                                            green: 66/255.0f
                                                             blue: 36/255.0f
                                                            alpha:1.0f];
    });
    return orangeGradientBeginColor4Selected;
}

+ (UIColor *)orangeGradientEndColorForSelected
{
    static UIColor *orangeGradientEndColor4Selected;
    static dispatch_once_t onceTokeOfOrangeGradientEndColor4Selected;
    dispatch_once(&onceTokeOfOrangeGradientEndColor4Selected, ^{
        orangeGradientEndColor4Selected = [UIColor colorWithRed:125/255.0f
                                                          green: 60/255.0f
                                                           blue: 34/255.0f
                                                          alpha:1.0f];
    });
    return orangeGradientEndColor4Selected;
}

+ (UIColor *)orangeGradientBeginColorForDisabled
{
    static UIColor *orangeGradientBeginColor4Disabled;
    static dispatch_once_t onceTokeOfOrangeGradientBeginColor4Disabled;
    dispatch_once(&onceTokeOfOrangeGradientBeginColor4Disabled, ^{
        orangeGradientBeginColor4Disabled = [UIColor colorWithRed:251/255.0f
                                                            green:193/255.0f
                                                             blue:165/255.0f
                                                            alpha:1.0f];
    });
    return orangeGradientBeginColor4Disabled;
}

+ (UIColor *)orangeGradientEndColorForDisabled
{
    static UIColor *orangeGradientEndColor4Disabled;
    static dispatch_once_t onceTokeOfOrangeGradientEndColor4Disabled;
    dispatch_once(&onceTokeOfOrangeGradientEndColor4Disabled, ^{
        orangeGradientEndColor4Disabled = [UIColor colorWithRed:254/255.0f
                                                          green:188/255.0f
                                                           blue:163/255.0f
                                                          alpha:1.0f];
    });
    return orangeGradientEndColor4Disabled;
}

+ (UIColor *)orangeBadgeColor
{
    static UIColor *orangeBadgeColor;
    static dispatch_once_t onceTokeOfOrangeBadgeColor;
    dispatch_once(&onceTokeOfOrangeBadgeColor, ^{
        orangeBadgeColor = [UIColor colorWithRed:254/255.0f
                                           green:134/255.0f
                                            blue: 74/255.0f
                                           alpha:1.0f];
    });
    return orangeBadgeColor;
}




/******************************************************************************/
/**** Utility Method                                                       ****/
/******************************************************************************/
#pragma mark - Utility Method

+ (UIColor *)colorWithHex:(NSString *)hexColorString
{
    return [WWColor colorWithHex:hexColorString alpha:1.0f];
}

+ (UIColor *)colorWithHex:(NSString *)hexColorString alpha:(CGFloat)alpha
{
    NSRange redHexRange = NSMakeRange(0, 2);
    NSString *redHexString = [hexColorString substringWithRange:redHexRange];
    
    NSRange greenHexRange = NSMakeRange(2, 2);
    NSString *greenHexString = [hexColorString substringWithRange:greenHexRange];
    
    NSRange blueHexRange = NSMakeRange(4, 2);
    NSString *blueHexString = [hexColorString substringWithRange:blueHexRange];

    unsigned int red   = 0;
    unsigned int green = 0;
    unsigned int blue  = 0;
    
    [[NSScanner scannerWithString:redHexString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenHexString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueHexString] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(  red/255.0f)
                           green:(float)(green/255.0f)
                            blue:(float)( blue/255.0f)
                           alpha:alpha];
}

/******************************************************************************/
/**** Utility Method - CSS Color Support                                   ****/
/******************************************************************************/
#pragma mark - Utility Method - CSS Color Support

+ (UIColor *)colorWithCssFormat:(NSString *)cssColorString
{
    if (cssColorString == nil || cssColorString.length == 0) {
        return nil;
    }
    
    cssColorString = [cssColorString lowercaseString];
    if ([cssColorString hasPrefix:@"#"]) {
        return [WWColor colorWithCssHex:cssColorString];
    }
    
    if ([cssColorString hasPrefix:@"rgb("] ||
        [cssColorString hasPrefix:@"rgba("])
    {
        return [WWColor colorWithCssRGB:cssColorString];
    }
    
    return [WWColor colorWithCssHex:cssColorString];
}


+ (UIColor *)colorWithCssHex:(NSString *)hexColorString
{
    if (hexColorString == nil || hexColorString.length == 0) {
        return nil;
    }
    
    // remove prefix
    if ([hexColorString hasPrefix:@"#"]) {
        hexColorString = [hexColorString substringFromIndex:1];
    }
    
    if (hexColorString.length != 6 && hexColorString.length != 8) {
        return nil;
    }
    
    NSRange redHexRange = NSMakeRange(0, 2);
    NSString *redHexString = [hexColorString substringWithRange:redHexRange];
    
    NSRange greenHexRange = NSMakeRange(2, 2);
    NSString *greenHexString = [hexColorString substringWithRange:greenHexRange];
    
    NSRange blueHexRange = NSMakeRange(4, 2);
    NSString *blueHexString = [hexColorString substringWithRange:blueHexRange];
    
    if (hexColorString.length == 6)
    {
        return [WWColor colorWithRedHex:redHexString
                                greenHex:greenHexString
                                 blueHex:blueHexString];
    }
    
    NSRange alphaHexRange = NSMakeRange(6, 2);
    NSString *alphaHexString = [hexColorString substringWithRange:alphaHexRange];
    
    return [WWColor colorWithRedHex:redHexString
                            greenHex:greenHexString
                             blueHex:blueHexString
                            alphaHex:alphaHexString];
}

+ (UIColor *)colorWithCssRGB:(NSString *)rgbColorString
{
    if (rgbColorString == nil || rgbColorString.length == 0) {
        return nil;
    }
    
    // to lowerCase
    rgbColorString = [rgbColorString lowercaseString];
    
    // remove suffix
    NSRange suffixRange = [rgbColorString rangeOfString:@")"];
    if (suffixRange.location != NSNotFound && suffixRange.length > 0)
    {
        rgbColorString = [rgbColorString substringToIndex:suffixRange.location];
    }
    
    // remove prefix
    NSRange prefixRange = [rgbColorString rangeOfString:@"("];
    if (prefixRange.location != NSNotFound && prefixRange.length > 0)
    {
        rgbColorString 
        = [rgbColorString substringFromIndex:(prefixRange.location + prefixRange.length)];
    }
    
    // split by comma
    NSArray *numberStrArray = [rgbColorString componentsSeparatedByString:@","];
    
    if (numberStrArray.count == 3) {
        return [WWColor colorWithRedNum:numberStrArray[0]
                                greenNum:numberStrArray[1]
                                 blueNum:numberStrArray[2]];
    }
    else if (numberStrArray.count == 4) {
        return [WWColor colorWithRedNum:numberStrArray[0]
                                greenNum:numberStrArray[1]
                                 blueNum:numberStrArray[2]
                                alphaNum:numberStrArray[3]];
    }
    
    return nil;
}

+ (UIColor *)colorWithRedHex:(NSString *)redHexString
                    greenHex:(NSString *)greenHexString
                     blueHex:(NSString *)blueHexString
{
    return [WWColor colorWithRedHex:redHexString
                            greenHex:greenHexString
                             blueHex:blueHexString
                            alphaHex:@"FF"];
}


+ (UIColor *)colorWithRedHex:(NSString *)redHexString
                    greenHex:(NSString *)greenHexString
                     blueHex:(NSString *)blueHexString
                    alphaHex:(NSString *)alphaHexString
{
    unsigned int red   = 0;
    unsigned int green = 0;
    unsigned int blue  = 0;
    unsigned int alpha = 0;
    
    [[NSScanner scannerWithString:redHexString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenHexString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueHexString] scanHexInt:&blue];
    [[NSScanner scannerWithString:alphaHexString] scanHexInt:&alpha];
    
    return [UIColor colorWithRed:  red/255.0f
                           green:green/255.0f
                            blue: blue/255.0f
                           alpha:alpha/255.0f];
}

+ (UIColor *)colorWithRedNum:(NSString *)redNumString
                    greenNum:(NSString *)greenNumString
                     blueNum:(NSString *)blueNumString
{
    return [WWColor colorWithRedNum:redNumString
                            greenNum:greenNumString
                             blueNum:blueNumString
                            alphaNum:@"1.0"];
}

+ (UIColor *)colorWithRedNum:(NSString *)redNumString
                    greenNum:(NSString *)greenNumString
                     blueNum:(NSString *)blueNumString
                    alphaNum:(NSString *)alphaNumString
{
    int   red   = 0;
    int   green = 0;
    int   blue  = 0;
    float alpha = 0;
    
    [[NSScanner scannerWithString:redNumString] scanInt:&red];
    [[NSScanner scannerWithString:greenNumString] scanInt:&green];
    [[NSScanner scannerWithString:blueNumString] scanInt:&blue];
    [[NSScanner scannerWithString:alphaNumString] scanFloat:&alpha];
    
    return [UIColor colorWithRed:  red/255.0f
                           green:green/255.0f
                            blue: blue/255.0f
                           alpha:alpha];
}



@end
