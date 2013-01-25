@protocol BookImageRequestDelegate <NSObject>

- (void)bookImageDidLoad:(UIImage *)image forIndexPath:(NSIndexPath *)path;
@end