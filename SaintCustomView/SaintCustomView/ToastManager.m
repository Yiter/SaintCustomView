//
//  XBToastManager.m
//  XB
//
//

#import "AppDelegate.h"
#import "ToastManager.h"

#define minshowtime   1.5
#define toastColor randomColor
#define progressColor randomColor

@interface ToastManager () {
    NSTimer *progresstimer;
    MBProgressHUD *toastHud;
    MBProgressHUD *progressHud;
}
@end

static ToastManager *toastManager;
@implementation ToastManager

#pragma mark -manager
+ (ToastManager *)ShardInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toastManager = [[ToastManager alloc] init];
        [toastManager actionRenderUIComponents];
    });
    return toastManager;
}

#pragma mark -keyWindow
+ (UIWindow *)keyWindow {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *keywindow = delegate.window;
    return keywindow;
}

#pragma mark -actionRenderUIComponents
- (void)actionRenderUIComponents {
    UIWindow *keywindow = [ToastManager keyWindow];
    toastHud = [[MBProgressHUD alloc] initWithWindow:keywindow];
    toastHud.minSize = CGSizeMake(220, 60);
    toastHud.userInteractionEnabled = NO;
    toastHud.mode = MBProgressHUDModeText;
    toastHud.minShowTime = minshowtime;
    toastHud.color =toastColor;
    toastHud.alpha = 0.3;
    [keywindow addSubview:toastHud];
    progressHud = [[MBProgressHUD alloc] initWithWindow:keywindow];
    progressHud.animationType = MBProgressHUDAnimationFade;
    progressHud.userInteractionEnabled = YES;
    progressHud.color =progressColor;
    progressHud.minShowTime = minshowtime;
    progressHud.labelText = @"加载中...";
    progressHud.square = YES;
    [keywindow addSubview:progressHud];
}

#pragma mark -toast
- (void)showtoast:(NSString *)toastStr {
    if (toastStr.length > 0) {
        if (toastStr.length > 15) {
            toastHud.labelText = @"";
            toastHud.detailsLabelText = toastStr;
        } else {
            toastHud.labelText = toastStr;
            toastHud.detailsLabelText = @"";
        }
        [[ToastManager keyWindow] bringSubviewToFront:toastHud];
        [toastHud show:YES];
        [toastHud hide:YES];
    }
}

- (void)showtoast:(NSString *)toastStr wait:(double)wait
{
    toastHud.minShowTime = wait;
    [self showtoast:toastStr];
    toastHud.minShowTime = minshowtime;
}

#pragma mark -progress
- (void)hideprogress {
    [progressHud hide:YES];
    [toastHud hide:YES];
}

- (void)showprogress {
    [toastHud hide:YES];
    [[ToastManager keyWindow] bringSubviewToFront:progressHud];
    [progressHud setMinShowTime:0];
    progressHud.labelText  = @"";
    [progressHud show:NO];
}

- (void)showHUD:(HUDShowType)type
{
    if (type <= HUDShowType_None)
        return;
    [self showprogress];
}



@end
