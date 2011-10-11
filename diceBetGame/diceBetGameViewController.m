//
//  diceBetGameViewController.m
//  diceBetGame
//
//  Created by apple on 11-8-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "diceBetGameViewController.h"

@implementation diceBetGameViewController

@synthesize diceImageView1;
@synthesize diceImageView2;
@synthesize diceImageView3;

@synthesize cashLabel;
@synthesize betLabel;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //參數初始化
    [super viewDidLoad];
    bet =0;
    cash=2000;

    [self showLabel];
    [self runRandom];
    [self showImage];
    [self animationDiceFun];
    [diceImageView1 startAnimating];
    [diceImageView2 startAnimating];
    [diceImageView3 startAnimating];
     
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//增加賭金
-(IBAction)addFunction:(id)sender{
    if (cash>=100) {
        bet +=100;
        cash -=100;
        [self showLabel];
        
        if (bet != 0) {
            [diceImageView1 startAnimating];
            [diceImageView2 startAnimating];
            [diceImageView3 startAnimating];
        }
    }
}
//減少賭金
-(IBAction)subFunction:(id)sender{
    if ((cash>=0)&&(bet>0)) {
        bet -=100;
        cash +=100;
        [self showLabel];
        if (bet != 0) {
            [diceImageView1 startAnimating];
            [diceImageView2 startAnimating];
            [diceImageView3 startAnimating];
        }else{
            [diceImageView1 stopAnimating];
            [diceImageView2 stopAnimating];
            [diceImageView3 stopAnimating];
            
        }
    }
}
//遊戲開始
-(IBAction)startFunction:(id)sender{
    if ((cash>=0)&&(bet>0)){
        [self runRandom];
        [diceImageView1 stopAnimating];
        [diceImageView2 stopAnimating];
        [diceImageView3 stopAnimating];
            //[NSThread sleepForTimeInterval:1];
        [self showImage];
        if ((diceNumber1==diceNumber2)&&(diceNumber2==diceNumber3)&&(diceNumber3==diceNumber1)) {
            
            cash = cash + 10 * bet;
            bet=0;
            [self showLabel];
        } else if ((diceNumber1==diceNumber2)||(diceNumber2==diceNumber3)||(diceNumber3==diceNumber1)) {
            cash = cash + 3 * bet;
            bet=0;
            [self showLabel];
        } else {
            bet =0;
            [self showLabel];
        }
    }
    [self alertMsg];
}
//顯示標簽
-(void)showLabel{
    [betLabel setText:[NSString stringWithFormat:@"%d",bet]];
    [cashLabel setText:[NSString stringWithFormat:@"%d",cash]];
}
//顯示圖片
-(void)showImage{
    [diceImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]]];
    [diceImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]]];
    [diceImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]]];
}
-(void)animationDiceFun{
    
    
    [diceImageView1 setAnimationImages:[NSArray arrayWithObjects:
                                        [UIImage imageNamed:@"dice1.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:@"dice2.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]],
                                        [UIImage imageNamed:@"dice4.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:@"dice5.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:@"dice6.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        nil]];
    [diceImageView1 setAnimationRepeatCount:0];
    [diceImageView1 setAnimationDuration:0.4];
    
    [diceImageView2 setAnimationImages:[NSArray arrayWithObjects:
                                        [UIImage imageNamed:@"dice1.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]],
                                        [UIImage imageNamed:@"dice2.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        [UIImage imageNamed:@"dice4.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:@"dice5.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]],
                                        [UIImage imageNamed:@"dice6.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        nil]];
    [diceImageView2 setAnimationRepeatCount:0];
    [diceImageView2 setAnimationDuration:0.4];
    
    [diceImageView3 setAnimationImages:[NSArray arrayWithObjects:
                                        [UIImage imageNamed:@"dice1.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:@"dice2.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]],
                                        [UIImage imageNamed:@"dice4.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        [UIImage imageNamed:@"dice5.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber2]],
                                        [UIImage imageNamed:@"dice6.png"],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber1]],
                                        [UIImage imageNamed:[NSString stringWithFormat:@"dice%d.png",diceNumber3]],
                                        nil]];    
    [diceImageView3 setAnimationRepeatCount:0];
    [diceImageView3 setAnimationDuration:0.4];
    
}
//產生亂數
-(void)runRandom{
    //diceNumber1 =6;
    //diceNumber2 =6;
    //diceNumber3 =6;
    
    diceNumber1 =arc4random()%6+1;
    diceNumber2 =arc4random()%6+1;
    diceNumber3 =arc4random()%6+1; 
    
}
//賭金全下
-(IBAction)allinFunction:(id)sender{
    if (cash>0) {
        bet=cash;
        cash=0;
    }    
    [self showLabel];
    [diceImageView1 startAnimating];
    [diceImageView2 startAnimating];
    [diceImageView3 startAnimating];

}
//重新開始
-(IBAction)resetCashFunction:(id)sender{
    bet=0;
    cash=2000;
    [self showLabel];
    [diceImageView1 startAnimating];
    [diceImageView2 startAnimating];
    [diceImageView3 startAnimating];
}

//判斷持有金額並顯示提示訊息
-(void)alertMsg{
    if ((cash==0)&&(bet==0)) {
        //提示訊息
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒您！" message:@"您沒錢了，遊戲結束\n如要重新開始，請點選\"再一次\"" delegate:self cancelButtonTitle:@"重新開始" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

@end
