#import "StatusUtil.h"

@implementation StatusUtil {

}

+ (NSString *)statusToTitle:(BookStatus)status {
    switch(status){
        case WISH:
            return @"想读";
        case READING:
            return @"在读";
        case READ:
            return @"读过";
        case NOTADDED:
            return @"";
        default:
            return @"";
    }
}

+ (NSString *)statusToString:(BookStatus)status {
    switch(status){
        case WISH:
            return @"wish";
        case READING:
            return @"reading";
        case READ:
            return @"read";
        case NOTADDED:
            return @"notadded";
        default:
            return @"";
    }
}


+ (NSString *)statusToTip:(BookStatus)status {
    switch (status) {
        case WISH:
            return @"我想读这本书";
        case READ:
            return @"我读过这本书";
        case READING:
            return @"我正在读这本书";
        case NOTADDED:
            return @"我尚未添加过这本书";
        default:
            return @"我尚未添加过这本书";
    }
}

@end