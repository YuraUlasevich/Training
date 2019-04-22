//
//  AbourMeViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "AboutMeViewController.h"


@interface AboutMeViewController ()

@end

@implementation AboutMeViewController
@synthesize transV, sidePanel, menuBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSidePanel:)];
    tapper.numberOfTapsRequired = 1;
    [transV addGestureRecognizer:tapper];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) hideSidePanel:(UIGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateEnded){
        [transV setHidden:YES];
        [UIView transitionWithView:sidePanel duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect frame = self->sidePanel.frame;
            frame.origin.x = -self->sidePanel.frame.size.width;
            self->sidePanel.frame = frame;
        } completion:nil];
    }
}

-(IBAction)buttonPressed:(id)sender{
    _count+=1;
    if(sender == menuBtn){
        if(_count%2==1){
            [transV setHidden:NO];
            [UIView transitionWithView:sidePanel duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self->sidePanel.frame;
                frame.origin.x = 0;
                self->sidePanel.frame = frame;
            } completion:nil];
        } else if(_count%2==0){
            [transV setHidden:YES];
            [UIView transitionWithView:sidePanel duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self->sidePanel.frame;
                frame.origin.x = -self->sidePanel.frame.size.width;
                self->sidePanel.frame = frame;
            } completion:nil];
        }
    }
}

- (IBAction)mainBtnPress:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)trainersBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainers" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainersViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)myTrainingsBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"MyTrainings" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MyTrainingsViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)calendarBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Calendar" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"CalendarViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)trainingsBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainings" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainingsViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}
@end
