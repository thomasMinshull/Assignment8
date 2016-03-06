//
//  TableViewController.m
//  Assignment8
//
//  Created by thomas minshull on 2016-02-22.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "Push.h"

static NSString *pushTableViewCell = @"pushTableViewCell";

@interface TableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSFetchRequest *pushFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Push"];
    NSSortDescriptor *creationDateSort = [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:YES];
    pushFetchRequest.sortDescriptors = @[creationDateSort];
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:pushFetchRequest
                                                                        managedObjectContext: appdelegate.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    self.fetchedResultsController.delegate = self;
    NSError *fetchingError = nil;
    if ([self.fetchedResultsController performFetch:&fetchingError]) {
        NSLog(@"Fetch Successful");
    } else {
        NSLog(@"Fetch Unsuccessful");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    return sectionInfo.numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pushTableViewCell forIndexPath:indexPath];
    
    Push *push = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", push.message];
    
    return cell;
}

#pragma mark -NSFetchedResultsControllerDelegate methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    if (type == NSFetchedResultsChangeDelete) {
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (type == NSFetchedResultsChangeInsert){
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
