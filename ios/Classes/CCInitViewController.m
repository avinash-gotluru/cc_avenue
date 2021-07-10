//
//  CCInitViewController.m
//  CCIntegrationKit
//
//  Created by test on 7/14/14.
//  Copyright (c) 2014 Avenues. All rights reserved.
//

#import "CCInitViewController.h"
#import "CCWebViewController.h"

@interface CCInitViewController ()

@end

@implementation CCInitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //scroll view
    UIScrollView *myScrollView;
    UIView *contentView;
    
    [myScrollView addSubview:contentView];
    myScrollView.contentSize = contentView.frame.size;
    
    
    self.accessCode.delegate = self;
    self.merchantId.delegate = self;
    self.currency.delegate = self;
    self.amount.delegate = self;
    
    int randomNumber = (arc4random() % 9999999) + 1;  // Merchant can write there logic to generate random number. Order number has to be unique for each transaction
    [self orderId].text = [NSString stringWithFormat:@"%d",randomNumber];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//for scroll view
-(void)viewDidLayoutSubviews
{
    
    self.Scrollview.contentSize = CGSizeMake(
                                             self.Scrollview.frame.size.width,
                                             self.Scrollview.frame.size.height + 300
                                             );
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}


//for next button
- (IBAction)nextbttn:(id)sender {

    NSLog(@"button clicked");
    CCWebViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CCWebViewController"];
    
    
    controller.accessCode = self.accessCode.text;
    controller.merchantId = self.merchantId.text;
    controller.amount = self.amount.text;
    controller.currency = self.currency.text;
    controller.orderId = self.orderId.text;
    controller.redirectUrl = self.redirectUrl.text;
    controller.cancelUrl = self.cancelUrl.text;
    controller.rsaKeyUrl = self.rsaKeyUrl.text;
 
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];
}


@end
