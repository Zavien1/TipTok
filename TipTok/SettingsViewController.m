//
//  SettingsViewController.m
//  TipTok
//
//  Created by Zavien Sibilia on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tipPercentageControl setSelectedSegmentIndex:(self.tipPercentageControl.selectedSegmentIndex)];
}

- (IBAction)changeTipPercentage:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentages[] = {0.18, 0.20, 0.25};
    
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    
    
    [defaults setDouble:tipPercentage forKey:@"tipPercent"];
    [defaults synchronize];
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
