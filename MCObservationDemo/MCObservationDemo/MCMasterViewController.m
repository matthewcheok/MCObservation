//
//  MCMasterViewController.m
//  MCViewDemo
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCMasterViewController.h"
#import "MCDetailViewController.h"
#import "MCDemoViewCell.h"

static NSString* kRandomStrings[] = {
    @"Apple", @"Banana", @"Cherry"
};
static NSInteger kRandomStringsCount = 3;

@interface MCMasterViewController () {
	NSMutableArray *_items;
}
@end

@implementation MCMasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    MCDemoObject *object = [[MCDemoObject alloc] initWithTitle:kRandomStrings[arc4random() % kRandomStringsCount]];
    
	if (!_items) {
		_items = [[NSMutableArray alloc] init];
	}
	[_items insertObject:object atIndex:0];
    
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MCDemoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    MCDemoObject *object = _items[indexPath.row];

	cell.object = object;
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[_items removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		MCDemoObject *object = _items[indexPath.row];
		[[segue destinationViewController] setDetailItem:object];
	}
}

@end
