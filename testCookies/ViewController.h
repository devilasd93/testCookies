//
//  ViewController.h
//  testCookies
//
//  Created by Dmitry on 16.05.17.
//  Copyright © 2017 dbsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wvTest;
@property (weak, nonatomic) IBOutlet UITableView *tvTest;
@property (strong, nonatomic) NSArray *dataList;

@end

