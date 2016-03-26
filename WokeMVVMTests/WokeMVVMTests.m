//
//  WokeMVVMTests.m
//  WokeMVVMTests
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HttpAgent.h"
@interface WokeMVVMTests : XCTestCase

@end

@implementation WokeMVVMTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCTestExpectation * expectation = [self expectationWithDescription:@"network test"];
    
    [[HttpAgent instance]requestWithModel:nil withComplete:^(HttpResponseModel *model, NSError *error) {
        [expectation fulfill];
    }];
    
    
    
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
