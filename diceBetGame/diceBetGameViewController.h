//
//  diceBetGameViewController.h
//  diceBetGame
//
//  Created by apple on 11-8-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface diceBetGameViewController : UIViewController {
    IBOutlet UIImageView *diceImageView1;//骰子
    IBOutlet UIImageView *diceImageView2;
    IBOutlet UIImageView *diceImageView3;
    IBOutlet UILabel *cashLabel;//顯示現金
    IBOutlet UILabel *betLabel;//顯示賭金
    int cash,bet; //cash 現金，bet 賭金
    int diceNumber1,diceNumber2,diceNumber3;
}
@property(nonatomic,retain) IBOutlet UIImageView *diceImageView1;
@property(nonatomic,retain) IBOutlet UIImageView *diceImageView2;
@property(nonatomic,retain) IBOutlet UIImageView *diceImageView3;

@property(nonatomic,retain) IBOutlet UILabel *cashLabel;
@property(nonatomic,retain) IBOutlet UILabel *betLabel;


-(IBAction)addFunction:(id)sender;//增加賭金
-(IBAction)subFunction:(id)sender;//減少賭金
-(IBAction)startFunction:(id)sender;//遊戲開始
-(IBAction)allinFunction:(id)sender;//賭金全下
-(IBAction)resetCashFunction:(id)sender;//重新開始

-(void)showLabel;//顯示標簽
-(void)showImage;//顯示圖片
-(void)animationDiceFun;
-(void)runRandom;//產生亂數
-(void)alertMsg;//判斷持有金額並顯示提示訊息
@end
