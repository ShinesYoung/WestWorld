//
//  WWColor.m
//  WWUI
//
//  Created by Shines Young on 2018/9/11.
//  Copyright © 2018年 net.shines. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#pragma mark - color
#define COLOR_WITH_HEX(_HEX_)       [WWColor colorWithHex:_HEX_]
#define COLOR(r, g, b)              [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define TRANSPARENT_COLOR           [UIColor clearColor]
#define TITLE_COLOR                 COLOR(0, 0, 0)
#define SUB_TITLE_COLOR             COLOR(157, 157, 157)

#define ORANGE_COLOR                COLOR(255, 103, 44)
#define HIGHLIGHT_ORANGE_COLOR      COLOR_WITH_HEX(@"e6501f")
#define BLUE_COLOR                  COLOR_WITH_HEX(@"4aa3ee")
#define HIGHLIGHT_BLUE_COLOR        COLOR_WITH_HEX(@"2889db")
#define PURPLE_COLOR                COLOR(76, 66, 150)
#define HIGHLIGHT_PURPLE_COLOR      COLOR(66, 58, 128)
#define DISABLED_BTN_COLOR          COLOR(206, 206, 206)
#define ORANGE_TEXT_COLOR           [WWColor colorWithHex:@"ff6633"]
#define GRAY_TEXT_COLOR             [WWColor colorWithHex:@"999999"]
#define GRAY_BACKGROUND_COLOR       [WWColor colorWithHex:@"e6e6e6"]



@interface WWColor : NSObject



/******************************************************************************/
/**** Utility - Alias Color Declared                                      ****/
/******************************************************************************/
#pragma mark - Utility - Alias Color Declared

+ (UIColor *)importantColor1;
+ (UIColor *)gradientColor1;

+ (UIColor *)importantColor2;

+ (UIColor *)importantColor3;
+ (UIColor *)gradientColor3;

+ (UIColor *)normalColor1;
+ (UIColor *)normalColor2;

+ (UIColor *)weakColor1;
+ (UIColor *)weakColor2;
+ (UIColor *)weakColor3;
+ (UIColor *)weakColor4;
+ (UIColor *)weakColor5;
+ (UIColor *)weakColor6;

+ (UIColor *)otherColor1;


/******************************************************************************/
/**** Utility - Color With Name                                            ****/
/******************************************************************************/
#pragma mark - Utility - Color With Name

+ (UIColor *)colorWithName:(NSString *)colorName;



/******************************************************************************/
/**** Utility - Common Color for UIComponent                               ****/
/******************************************************************************/
#pragma mark - Utility - Common Color for UIComponent

#pragma mark - Top & Bottom Line Color
+ (UIColor *)topLineColor;                  // #ACACAC
+ (UIColor *)bottomLineColor;               // #ACACAC

#pragma mark - Blue Color Series
+ (UIColor *)blueTitleColorForNormal;       // #007AFF
+ (UIColor *)blueTitleColorForSelected;     // #003C7F
+ (UIColor *)blueTitleColorForDisabled;     // #7FBCFF

#pragma mark - Green Color Series
+ (UIColor *)greenTitleColor;               // #30C35F

#pragma mark - Orange Color Series
+ (UIColor *)orangeColorForNormal;          // #FC7946
+ (UIColor *)orangeColorForSelected;        // #7E4224
+ (UIColor *)orangeColorForDisabled;        // #FEBCA3

+ (UIColor *)orangeGradientBeginColorForNormal;     // #FE864A
+ (UIColor *)orangeGradientEndColorForNormal;       // #FC7946
+ (UIColor *)orangeGradientBeginColorForSelected;   // #7E4224
+ (UIColor *)orangeGradientEndColorForSelected;     // #7D3C22
+ (UIColor *)orangeGradientBeginColorForDisabled;   // #FBC1A5
+ (UIColor *)orangeGradientEndColorForDisabled;     // #FEBCA3

+ (UIColor *)orangeBadgeColor;              // #FE864A




/******************************************************************************/
/**** Utility Method                                                       ****/
/******************************************************************************/
#pragma mark - Utility Method

/**
 *
 */
+ (UIColor *)colorWithHex:(NSString *)hexColorString;

+ (UIColor *)colorWithHex:(NSString *)hexColorString alpha:(CGFloat)alpha;

/**
 * colorWithCss
 * 支持css规范的颜色字符串，包括hex_number，rgb_number,
 * 具体格式，例如
 *   FFFFFF
 *   FF0088FF
 *   #AABBCC
 *   #00FFCCFF
 *   rgb(r,g,b)
 *   RGB(r,g,b)
 *   rgba(r,g,b,a)
 *   RGBA(r,g,b,a)
 */
+ (UIColor *)colorWithCssFormat:(NSString *)cssColorString;

/**
 * colorWithHexFormat 支持css hex_number规范的颜色字符串,
 * 具体格式，例如
 *   FFFFFF
 *   FF0088FF
 *   #AABBCC
 *   #00FFCCFF
 */
+ (UIColor *)colorWithCssHex:(NSString *)hexColorString;

/**
 * colorWithHexFormat 支持css rgb_number规范的颜色字符串，
 * 具体格式，例如
 *   rgb(r,g,b)
 *   RGB(r,g,b)
 *   rgba(r,g,b,a)
 *   RGBA(r,g,b,a)
 */
+ (UIColor *)colorWithCssRGB:(NSString *)rgbColorString;


+ (UIColor *)colorWithRedHex:(NSString *)redHexString
                    greenHex:(NSString *)greenHexString
                     blueHex:(NSString *)blueHexString;

+ (UIColor *)colorWithRedHex:(NSString *)redHexString
                    greenHex:(NSString *)greenHexString
                     blueHex:(NSString *)blueHexString
                    alphaHex:(NSString *)alphaHexString;

+ (UIColor *)colorWithRedNum:(NSString *)redNumString
                    greenNum:(NSString *)greenNumString
                     blueNum:(NSString *)blueNumString;

+ (UIColor *)colorWithRedNum:(NSString *)redNumString
                    greenNum:(NSString *)greenNumString
                     blueNum:(NSString *)blueNumString
                    alphaNum:(NSString *)alphaNumString;



@end
