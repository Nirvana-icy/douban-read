#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (UIImage *)cropToWidth:(int)width andHeight:(int)height {
    CGFloat imageWidth = self.size.width;
    CGFloat imageHeight = self.size.height;
    CGFloat cropXStartPoint = 0.0f;
    CGFloat cropYStartPoint = 0.0f;
    if (imageWidth > width) {
        cropXStartPoint = (imageWidth - width) / 2;
    }
    if (imageHeight > height) {
        cropYStartPoint = (imageHeight - height) / 2;
    }
    CGRect rect = CGRectMake(cropXStartPoint, cropYStartPoint, width, height);
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);

    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    if(imageRef){
        CFRelease(imageRef);
    }
    return cropped;
}

@end