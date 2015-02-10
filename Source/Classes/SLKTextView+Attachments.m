//
//  SLKTextView+Attachments.m
//  Pods
//
//  Created by KattMing on 2/9/15.
//
//

#import "SLKTextView+Attachments.h"

@implementation SLKTextView (Attachments)

//Thanks @Saurman
- (void)slk_insertImage:(UIImage *)image roundedCorners:(BOOL)roundedCorners {
    NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];
    
    // find image if its already there and remove it
    [attributedString enumerateAttributesInRange:(NSMakeRange(0, attributedString.length)) options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        id attachment = [attrs objectForKey:NSAttachmentAttributeName];
        if ( attachment && [attachment isKindOfClass:[NSTextAttachment class]] ) {
            [attributedString deleteCharactersInRange:range];
            *stop = YES;
        }
    }];
    
    
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [self imageWithImage:image roundedCorners:roundedCorners];
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString insertAttributedString:attrStringWithImage atIndex:0];
    self.attributedText = attributedString;
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:nil];
}

- (BOOL)slk_hasImageAttachment {
    __block BOOL result = NO;
    [self.attributedText enumerateAttributesInRange:(NSMakeRange(0, self.attributedText.length)) options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        id attachment = [attrs objectForKey:NSAttachmentAttributeName];
        if ( attachment && [attachment isKindOfClass:[NSTextAttachment class]] ) {
            result = YES;
            *stop = YES;
        }
    }];
    
    return result;
}

- (UIImage*)imageWithImage:(UIImage*)image roundedCorners:(BOOL)roundedCorners {
    CGFloat oldWidth = image.size.width;
    CGFloat scaleFactor = oldWidth / (CGRectGetWidth(self.frame)/4);
    image = [UIImage imageWithCGImage:image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
    
    return roundedCorners ? [self makeRoundCornersWithRadius:5.0 inputImage:image] : image;
}

-(UIImage*)makeRoundCornersWithRadius:(const CGFloat)RADIUS inputImage:(UIImage *)inputImage {
    UIImage *image = inputImage;
    // Begin a new image that will be the new image with the rounded corners
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    const CGRect RECT = CGRectMake(0, 0, image.size.width, image.size.height);
    [[UIBezierPath bezierPathWithRoundedRect:RECT cornerRadius:RADIUS] addClip];
    [image drawInRect:RECT];
    
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageNew;
}

@end