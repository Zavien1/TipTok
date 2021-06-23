//
//  TipViewController.m
//  TipTok
//
//  Created by Zavien Sibilia on 6/22/21.
//

#import "TipViewController.h"



@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UIView *billFieldView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideLabels];
    [self.billField becomeFirstResponder];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    double tipValue = [defaults doubleForKey:@"tipPercent"];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipValue;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}




- (IBAction)updateLabels:(id)sender {
    
if(self.billField.text.length > 0){
        [self showLabels];
    } else {
        [self hideLabels];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    double tipValue = [defaults doubleForKey:@"tipPercent"];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipValue;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billFieldView.frame;
        billFrame.origin.y = 90;
        
        self.billFieldView.frame = billFrame;
        self.billFieldView.backgroundColor = [UIColor systemGreenColor];
        
        CGRect labelFrame = self.labelsContainerView.frame;
        labelFrame.origin.y = 314;
        
        self.labelsContainerView.frame = labelFrame;
        
        self.labelsContainerView.alpha = 1;
    }];
    
 
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billFieldView.frame;
        billFrame.origin.y = 383;
        
        self.billFieldView.frame = billFrame;
        
        CGRect labelFrame = self.labelsContainerView.frame;
        labelFrame.origin.y = 563;
        
        self.labelsContainerView.frame = labelFrame;
        
        self.labelsContainerView.alpha = 0;
        self.billFieldView.backgroundColor = [UIColor whiteColor];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
