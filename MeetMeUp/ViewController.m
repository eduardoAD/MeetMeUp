//
//  ViewController.m
//  MeetMeUp
//
//  Created by Eduardo Alvarado Díaz on 10/13/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "ViewController.h"
#import "DetailMeetupViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSArray *meetupResults;
@property NSDictionary *selectedMeetup;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=35476c66197967107464723a5869147"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        NSError *jsonError = nil;

        self.meetupResults = [((NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]) objectForKey:@"results"];

        [self.tableView reloadData];

        //NSLog(@"Connection error: %@", connectionError);
        //NSLog(@"JSON error: %@", jsonError);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCellID" forIndexPath:indexPath];

    NSDictionary *meetup = (NSDictionary *)[self.meetupResults objectAtIndex:indexPath.row];

    cell.textLabel.text = [meetup objectForKey:@"name"];
    cell.detailTextLabel.text = [(NSDictionary *)[meetup objectForKey:@"venue"] objectForKey:@"address_1"];

    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.meetupResults.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailMeetupViewController *destination = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

    self.selectedMeetup = (NSDictionary *)[self.meetupResults objectAtIndex:indexPath.row];

    destination.meetup = self.selectedMeetup;
}

@end
