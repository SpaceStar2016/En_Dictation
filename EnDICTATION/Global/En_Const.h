//
//  En_Const.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/20.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//weakSelf
#define WEAKSELF __weak typeof(self) weakSelf = self

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height


#define SPSColor(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define SPSRandomColor   SPSColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define SPSColorMaker(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define SPS_DISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

#define En_GlobalWhite          SPSColorMaker(255,255,255,1.0)
#define En_GlobalBlack         SPSColorMaker(0,0,0,1.0)

#define En_GlobalTextGrey          SPSColorMaker(90,90,90,1.0)

#define En_GlobalShadowGrey          SPSColorMaker(200,183,183,1.0)

//#define En_GlobalSkyBlue          SPSColorMaker(74,171,246,1.0)
#define En_GlobalPurple          SPSColorMaker(132,119,215,1.0)
//8477d7


typedef NS_ENUM(NSUInteger, En_NumLevel) {
    En_NumLevelIron = 0,
    En_NumLevelBronze,
    En_NumLevelSilver,
    En_NumLevelGold,
    En_NumLevelDiamond,
    En_NumLevelUnstop
};

typedef NS_ENUM(NSUInteger, En_NumRange) {
    En_NumRangeZTT = 0,
    En_NumRange1XTX0,
    En_NumRangeCus,
    En_NumDate,
};

NS_ASSUME_NONNULL_END
