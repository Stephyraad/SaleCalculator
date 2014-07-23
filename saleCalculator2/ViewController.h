//
//  ViewController.h
//  saleCalculator2
//
//  Created by stephanie Raad on 7/22/14.
//  Copyright (c) 2014 Stephanie Raad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *priceAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *salePercent;

@property (weak, nonatomic) IBOutlet UITextField *savedAmount;

@property (weak, nonatomic) IBOutlet UITextField *totalAmount;

- (IBAction)percentChange:(UISegmentedControl *)sender;
-(void)displayTotalAmount: (float)amount;
-(float)calculateSalePercentForSegment:(int)segment;
-(float)getPriceAmount;
-(float)calculateSavedAmount:(float) amount percent: (float)percent;
-(void)updateDisplayedSale;
-(void)updateDisplayedTotal;
@end
