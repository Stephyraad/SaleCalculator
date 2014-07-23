//
//  ViewController.m
//  saleCalculator2
//
//  Created by stephanie Raad on 7/22/14.
//  Copyright (c) 2014 Stephanie Raad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self displayKeyboard];//calls on the display keyboard method when the app loads.
}

-(void)displayKeyboard
{
    [self.priceAmount becomeFirstResponder ];// makes the price tag be the selected first and along with that, the keyboad pop up.
}
-(void)dismissKeyboard
{
    [self.priceAmount resignFirstResponder];//removes the keyboard.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)percentChange:(UISegmentedControl *)sender
{
    [self updateDisplayedSale];
    [self updateDisplayedTotal];
    [self dismissKeyboard];//calls on the dismissKeyboard method to remove the keyboard when a percent change is selected.
    
}

-(NSString *)formatCurrency:(float)amount
{
    NSNumberFormatter *numformatter= [[NSNumberFormatter alloc] init];
    numformatter.numberStyle= NSNumberFormatterCurrencyStyle;
    NSNumber *number= [NSNumber numberWithInt:amount];
    return [numformatter stringFromNumber:number];
}
-(void)displayTotalAmount: (float)amount
{
    self.priceAmount.text= [self formatCurrency:amount];
}

-(void)displaySavedAmount: (float)amount
{
    self.savedAmount.text= [self formatCurrency:amount];
}
-(float)calculateSalePercentForSegment:(int)segment
{
    NSString *saleText= [self.salePercent titleForSegmentAtIndex:segment];
    return [saleText floatValue]/100.0;
}
-(float)getPriceAmount
{
    return [self.priceAmount.text floatValue];
}
-(float)calculateSavedAmount:(float)amount percent:(float)percent
{
    return amount * percent;
}
-(void)updateDisplayedSale
{
//    self.savedAmount.text=@"$0.00";
    float amount = [self getPriceAmount];
    int segment = self.salePercent.selectedSegmentIndex;
    float percent= [self calculateSalePercentForSegment:segment];
    float saving=[self calculateSavedAmount:amount percent:percent];
    self.savedAmount.text= [self formatCurrency:saving];
}

-(void)updateDisplayedTotal
{
//    self.totalAmount.text= @"$0.00";
    float amount = [self getPriceAmount];
    int segment = self.salePercent.selectedSegmentIndex;
    float percent= [self calculateSalePercentForSegment:segment];
    float saving=[self calculateSavedAmount:amount percent:percent];
    self.totalAmount.text= [self formatCurrency:amount-saving];
}
@end
