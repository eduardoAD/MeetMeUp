//
//  DetailMeetupViewController.m
//  MeetMeUp
//
//  Created by Eduardo Alvarado Díaz on 10/13/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "DetailMeetupViewController.h"
#import "WebViewController.h"

@interface DetailMeetupViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (strong, nonatomic) IBOutlet UILabel *groupLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionText;
@property (strong, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation DetailMeetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = [self.meetup objectForKey:@"name"];

    self.rsvpLabel.text = [[self.meetup objectForKey:@"yes_rsvp_count"] description];

    self.groupLabel.text = [[(NSDictionary *)self.meetup objectForKey:@"group"] objectForKey:@"name"];

    self.urlLabel.text = [[self.meetup objectForKey:@"event_url"] description];

    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[[self.meetup objectForKey:@"description"] dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.descriptionText.attributedText = attributedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *destination = [segue destinationViewController];
    destination.urlString = [self.meetup objectForKey:@"event_url"];
    NSLog(@"urlString: %@",destination.urlString);
}


@end
