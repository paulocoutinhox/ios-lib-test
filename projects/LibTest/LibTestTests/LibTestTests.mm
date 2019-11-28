//
//  LibTestTests.m
//  LibTestTests
//
//  Created by Paulo Coutinho on 28/11/19.
//  Copyright © 2019 PRSoluções. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "library.hpp"

@interface LibTestTests : XCTestCase

@end

@implementation LibTestTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    cppTestOne();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
