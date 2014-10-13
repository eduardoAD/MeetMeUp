//
//  ViewController.m
//  MeetMeUp
//
//  Created by Eduardo Alvarado Díaz on 10/13/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *events;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=35476c66197967107464723a5869147"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",jsonString);

        NSError *jsonError = nil;
        self.events = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];


        NSLog(@"Connection error: %@", connectionError);
        NSLog(@"JSON error: %@", jsonError);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
