//
//  ViewController.m
//  testCookies
//
//  Created by Dmitry on 16.05.17.
//  Copyright © 2017 dbsoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataList = [[NSArray alloc] init];
    _tvTest.dataSource = self;
    _tvTest.delegate = self;
    _tvTest.rowHeight = UITableViewAutomaticDimension;
    _tvTest.estimatedRowHeight = 50.0f;
    _tvTest.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _wvTest.delegate = self;
    [_wvTest loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"https://kaspi.kz/shop/"]]];
    [_tvTest reloadData];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    _dataList = [cookieJar cookies];
    for (cookie in _dataList) {
        NSLog(@"COOKIE IS %@", cookie);
    }
    [_tvTest reloadData];
}

#pragma mark - TableView Datasource Delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *name = [((NSHTTPCookie *)_dataList[indexPath.row]) name];
    NSString *value = [((NSHTTPCookie *)_dataList[indexPath.row]) value]; 
    NSString *str =  [NSString stringWithFormat:@"%@ - %@",name,value];
    cell.textLabel.text = str;
    return cell;
}

#pragma mark - Tableview datasource and delegates methods
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


@end
