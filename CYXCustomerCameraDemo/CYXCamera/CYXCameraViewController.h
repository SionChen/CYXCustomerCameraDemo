//
//  CYXCameraViewController.h
//  CYXCustomerCameraDemo
//
//  Created by 超级腕电商 on 2019/2/22.
//  Copyright © 2019年 超级腕电商. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_END
@protocol CYXCameraDelegate <NSObject>
/*选择身份图片*/
-(void)cameraDidSelectedIdcardPhotoImage:(UIImage *)image;

@end
@interface CYXCameraViewController : UIViewController
/*是否是身份证正面*/
@property (nonatomic,assign) BOOL isCardFront;
@property (nonatomic,weak) id<CYXCameraDelegate> delegate;
@end


