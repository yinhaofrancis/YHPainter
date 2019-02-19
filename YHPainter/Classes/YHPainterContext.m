//
//  YHPainterContext.m
//  YHPainter
//
//  Created by KnowChat02 on 2019/2/19.
//

#import "YHPainterContext.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <ImageIO/ImageIO.h>
#import <QuartzCore/QuartzCore.h>



CGContextRef createContext(CGSize size,CGFloat scale){
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(nil, (int) scale* size.width, (int)scale * size.height, 8, 0, space, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
    
    CGContextScaleCTM(ctx, scale, scale);
    CGColorSpaceRelease(space);
    return ctx;
}
CGContextRef createContextScreenScale(CGSize size){
    return createContext(size, SCREEMSCALE);
}
CGContextRef createContextNoAlpha(CGSize size,CGFloat scale,CGColorRef fillColor){
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             nil,
                                             (int)size.width * scale,
                                             (int)size.height * scale,
                                             8,
                                             0,
                                             space,
                                             kCGImageAlphaNoneSkipLast | kCGBitmapByteOrderDefault);
    
    CGContextScaleCTM(ctx, scale, scale);
    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, fillColor);
    CGContextFillRect(ctx, (CGRect){0,0,size.width,size.height});
    CGContextRestoreGState(ctx);
    CGColorSpaceRelease(space);
    return ctx;
    
}
CGImageRef CGBitContextExportPNG(CGContextRef ctx,CGFloat quality){
    CGImageRef img = CGBitmapContextCreateImage(ctx);
    CFMutableDataRef data = CFDataCreateMutable(kCFAllocatorSystemDefault, 0);
    CGImageDestinationRef destination = CGImageDestinationCreateWithData(data, kUTTypePNG, 1, NULL);
    CFNumberRef number = CFNumberCreate(kCFAllocatorSystemDefault, kCFNumberFloatType, &quality);
    CFTypeRef v[1];
    CFTypeRef  n[1];
    v[0] = kCGImageDestinationLossyCompressionQuality;
    n[0] = number;
    
    CFDictionaryRef property = CFDictionaryCreate(kCFAllocatorSystemDefault, (const void**)&v, (const void**)&n, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    CGImageDestinationAddImage(destination, img, property);
    CGImageDestinationFinalize(destination);
    
    CGImageSourceRef source = CGImageSourceCreateWithData(data, nil);
    CGImageRef result = CGImageSourceCreateImageAtIndex(source, 0, nil);
    
    CGImageRelease(img);
    CFRelease(data);
    CFRelease(destination);
    CFRelease(number);
    CFAutorelease(property);
    CFRelease(source);
    return result;
}
CGImageRef CGBitContextExportJPG(CGContextRef ctx,CGFloat quality){
    CGImageRef img = CGBitmapContextCreateImage(ctx);
    CFMutableDataRef data = CFDataCreateMutable(kCFAllocatorSystemDefault, 0);
    CGImageDestinationRef destination = CGImageDestinationCreateWithData(data, kUTTypeJPEG, 1, NULL);
    CFNumberRef number = CFNumberCreate(kCFAllocatorSystemDefault, kCFNumberFloatType, &quality);
    CFTypeRef v[1];
    CFTypeRef  n[1];
    v[0] = kCGImageDestinationLossyCompressionQuality;
    n[0] = number;
    
    CFDictionaryRef property = CFDictionaryCreate(kCFAllocatorSystemDefault, (const void**)&v, (const void**)&n, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    CGImageDestinationAddImage(destination, img, property);
    CGImageDestinationFinalize(destination);
    
    CGImageSourceRef source = CGImageSourceCreateWithData(data, nil);
    CGImageRef result = CGImageSourceCreateImageAtIndex(source, 0, nil);
    
    CGImageRelease(img);
    CFRelease(data);
    CFRelease(destination);
    CFRelease(number);
    CFAutorelease(property);
    CFRelease(source);
    return result;
}
