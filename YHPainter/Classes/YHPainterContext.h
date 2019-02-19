//
//  YHPainterContext.h
//  YHPainter
//
//  Created by KnowChat02 on 2019/2/19.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
#define SCREEMSCALE [UIScreen mainScreen].scale

CGContextRef createContext(CGSize size,CGFloat scale);
CGContextRef createContextScreenScale(CGSize size);
CGImageRef CGBitContextExportPNG(CGContextRef ctx,CGFloat quality);
CGContextRef createContextNoAlpha(CGSize size,CGFloat scale,CGColorRef fillColor);
NS_ASSUME_NONNULL_END
