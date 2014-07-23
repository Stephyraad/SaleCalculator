//
//  saleCalculator2Tests.m
//  saleCalculator2Tests
//
//  Created by stephanie Raad on 7/22/14.
//  Copyright (c) 2014 Stephanie Raad. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface saleCalculator2Tests : XCTestCase

@property(strong, nonatomic) ViewController *vc;
@end

@implementation saleCalculator2Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc =[storyboard instantiateInitialViewController];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatVCInstantiates
{
    XCTAssertNotNil(self.vc);
}

-(void)testDisplayTotalAmountTo0
{
    [self.vc displayTotalAmount: 12];
    NSString *result = self.vc.priceAmount.text;
    XCTAssertEqualObjects(result, @"$12.00");
}

-(void) testCalculatePercentChangeForSegment0
{
    float percent = [self.vc calculateSalePercentForSegment:0];
    XCTAssertEqualWithAccuracy(percent, 0.15, 0.001, @"Expected percent %f should be 0.15", percent);
}

-(void)testGetPriceAmountWhenBlank
{
    self.vc.priceAmount.text= @"";
    float result= [self.vc getPriceAmount];
    XCTAssertEqualWithAccuracy(result, 0.0, 0.001);
}
-(void)testGetPriceAmountWhen12
{
    self.vc.priceAmount.text= @"12";
    float result= [self.vc getPriceAmount];
    XCTAssertEqualWithAccuracy(result, 12.0, 0.001);
}
-(void)testGetPriceAmountWhen20point50point30
{
    self.vc.priceAmount.text= @"12.50.30";
    float result= [self.vc getPriceAmount];
    XCTAssertEqualWithAccuracy(result, 12.50, 0.001);
}
-(void)testCalculateSavedAmount
{
    float saving= [self.vc calculateSavedAmount: 30.00 percent:0.15];
    XCTAssertEqualWithAccuracy(saving, 4.5,0.05);
}
-(void)testUpdateDisplayedSaleForZero
{
    self.vc.priceAmount.text= @"0";
    self.vc.salePercent.selectedSegmentIndex=1;
    [self.vc updateDisplayedSale];
    NSString *saleString= self.vc.savedAmount.text;
    XCTAssertEqualObjects(saleString, @"$0.00");
}
-(void)testUpdateDisplayedSalefor20y15Percent
{
    self.vc.priceAmount.text=@"20";
    self.vc.salePercent.selectedSegmentIndex=0;
    [self.vc updateDisplayedSale];
    NSString *saleString= self.vc.savedAmount.text;
    XCTAssertEqualObjects(saleString, @"$3.00");
}
-(void)testUpdateDisplayedTotalForZero
{
    self.vc.priceAmount.text= @"0";
    self.vc.salePercent.selectedSegmentIndex=1;
    [self.vc updateDisplayedTotal];
    NSString *saleString= self.vc.totalAmount.text;
    XCTAssertEqualObjects(saleString, @"$0.00");
}

-(void)testUpdateDisplayedTotalfor20y15Percent
{
    self.vc.priceAmount.text=@"20";
    self.vc.salePercent.selectedSegmentIndex=0;
    [self.vc updateDisplayedTotal];
    NSString *saleString= self.vc.totalAmount.text;
    XCTAssertEqualObjects(saleString, @"$17.00");
}
@end
