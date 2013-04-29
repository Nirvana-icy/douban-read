#import <QuartzCore/QuartzCore.h>
#import "CommentViewController.h"
#import "BookStatusChangeRequest.h"
#import "BookDetailViewController.h"
#import "DOUBook.h"

@implementation CommentViewController {
    UIBarButtonItem *sendCommentButton;
    SEL theAction;
    BookDetailViewController *target;
    DOUBook *book;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView {
    [super loadView];

    [_commentTextArea setDelegate:self];
    [_commentTextArea setText:[book myComment]];
    _commentTextArea.layer.borderWidth = 1.0f;
    _commentTextArea.layer.borderColor = [[UIColor grayColor] CGColor];

    sendCommentButton = [[UIBarButtonItem alloc]
            initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:theAction];
    self.navigationItem.rightBarButtonItem = sendCommentButton;
    [sendCommentButton setEnabled:_commentTextArea.text.length != 0];
}

- (void)finishReading {
    [self changeBookToStatus:@"read"];
}

- (void)reading {
    [self changeBookToStatus:@"reading"];
}

- (void)changeBookToStatus:(NSString *)status {
    [[self navigationController] popViewControllerAnimated:YES];
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:target];
    [request changeBook:book toStatus:status withComment:_commentTextArea.text];
}

- (void)viewDidUnload {
    [self setCommentLabel:nil];
    [self setCommentTextArea:nil];
    [super viewDidUnload];
}

- (void)textViewDidChange:(UITextView *)textView {
    int length = [self lengthOf:textView.text];
    [sendCommentButton setEnabled:length != 0];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_commentTextArea resignFirstResponder];
}

- (int)lengthOf:(NSString *)text {
    int sum = 0;
    for (int i = 0; i < [text length]; i++) {
        NSString *character = [text substringWithRange:NSMakeRange(i, 1)];
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3) {
            sum += 2;
        }
        else {
            sum++;
        }
    }
    return sum;
}

- (void)setAction:(SEL)action {
    theAction = action;
}

- (void)setBook:(DOUBook *)theBook{
    book = theBook;
}

- (void)setTarget:(BookDetailViewController *)controller {
    target = controller;
}
@end
