//
//  MBaseOfflineTests.m
//  MBase
//
//  Created by Jason Whitehorn on 7/29/13.
//  Copyright (c) 2012-2013 Waterfield Technologies. All rights reserved.
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "MBaseOfflineTests.h"
#import "MBase.h"
#import "MBaseOffline.h"
#import "OCMockObject.h"
#import "TestModel.h"

@implementation MBaseOfflineTests

- (void) testEnableOfflineMode{
    id mock = [OCMockObject mockForClass:[MBaseOffline class]];
    [MBaseOffline setInstance:mock];
    
    [[mock expect] setApiHost:@"www.apple.com"];
    
    [MBase setUrlBase:@"http://www.apple.com/"];
    [MBase enableOfflineSupport];
    
    [mock verify];
    [MBaseOffline setInstance:nil];
}

- (void) testOfflineSupportFalseIfNotEnabled{
    STAssertFalse([[MBaseOffline instance] offlineSupport], @"Offline support shouldn't be enabled");
}

- (void) testOfflineSupportTrueIfEnabled{
    [[MBaseOffline instance] setApiHost:@"www.apple.com"];
    
    STAssertTrue([[MBaseOffline instance] offlineSupport], @"Offline support should be enabled");
}
/*
- (void) testPostToPathChecksApiReachable{
    id mock = [OCMockObject mockForClass:[MBaseOffline class]];
    [MBaseOffline setInstance:mock];
    
    [[mock expect] apiReachable];
    
    TestModel *model = [TestModel new];
    [model postToPath:@"/aPath"];
    
    [mock verify];
    [MBaseOffline setInstance:nil];
}*/

@end
