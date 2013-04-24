#import <QuartzCore/QuartzCore.h>
#import "CommentViewController.h"
#import "BookStatusChangeRequest.h"
#import "BookDetailViewController.h"

@implementation CommentViewController {
    UIBarButtonItem *sendCommentButton;
    SEL theAction;
    NSString *bookId;
    BookDetailViewController *target;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView {
    [super loadView];
    sendCommentButton = [[UIBarButtonItem alloc]
            initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:theAction];
    [sendCommentButton setEnabled:NO];
    self.navigationItem.rightBarButtonItem = sendCommentButton;
    [_commentTextArea setDelegate:self];
    _commentTextArea.layer.borderWidth = 1.0f;
    _commentTextArea.layer.borderColor = [[UIColor grayColor] CGColor];
}

- (void)finishReading {
    [[self navigationController] popViewControllerAnimated:YES];
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:target];
    [request changeBook:bookId toStatus:@"read" withComment:_commentTextArea.text];
}


- (void)viewDidUnload {
    [self setRatingLabel:nil];
    [self setCommentLabel:nil];
    [self setCommentTextArea:nil];
    [super viewDidUnload];
}

- (void)textViewDidChange:(UITextView *)textView {
    int length= [self lengthOf:textView.text];
    [sendCommentButton setEnabled:length != 0];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_commentTextArea resignFirstResponder];
}

-(int)lengthOf:(NSString *)text{
    int sum=0;
    for (int i=0; i<[text length]; i++) {
        NSString *character=[text substringWithRange:NSMakeRange(i, 1)];
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding]==3) {
            sum+=2;
        }
        else{
            sum++;
        }
    }
    return sum;
}

- (void)setAction:(SEL)action {
    theAction = action;
}

- (void)setBookId:(NSString *)theBookId {
    bookId = theBookId;
}

- (void)setTarget:(BookDetailViewController *)controller {
    target = controller;
}
@end
