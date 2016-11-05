//
//  WBHomeViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBHomeViewController.h"

#import <AFNetworking.h>
@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
//g_sessionid=iPho2016110519203820d2a4939b1d7918036d68e20d672713&g_phone=15764236469&g_ipAddress=192.168.2.2&location=116.342599%2C40.064792&ServiceProvider=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&GPS_LatLng=116.342599%2C40.064792&__d=d14ryS1fFUBzfepnq%2FZ6TTGu4FL5BflWngM1OVdPwqYeNZW4%2FZM5HpHJlnwAZPd5UyoGAl5Xrhjtgyf9WtWEOB%2Bni%2FaZle7FikprqPj4izDd5Y64bArJqMndq0Z6x14eK17f&__v=ios5.8&phoneType=iPhone+6+%28A1549%2FA1586%29&realtime_cart=0&g_version=3.60&timestamp=1478344884384816&token=612a08e73e485490562997fa6daa80c7&mac=dab90c9c2168ef811651d19e8d5dddf6
//    
//    NSDictionary *dict = @{@"g_uniqid":@"612a08e73e485490562997fa6daa80c7",
//                           @"g_screen_points":@"375x667",
//                           @"g_product":@"BEE",
//                           @"NetworkType":@"wifi",
//                           @"g_screen_pixels":@"750x1334",
//                           @"sys_version":@"10.0.2",
//                           @"g_platform":@"IOS",
//                           @"g_channel":@"60001",
//                           @"g_sessionid":@"iPho2016110519203820d2a4939b1d7918036d68e20d672713",
//                           @"":@"",
//                           @"":@"",
//                           @"":@"",
//                           @"":@"",
//                           @"":@"",
//                           @"":@"",
//                           
//                           
//                           }
    
    [manager POST:@"http://api.beequick.cn/home?g_uniqid=612a08e73e485490562997fa6daa80c7&g_screen_points=375x667&g_product=BEE&g_screen_pixels=750x1334&sys_version=10.0.2&g_channel=60001&g_sessionid=iPho2016110519203820d2a4939b1d7918036d68e20d672713&g_phone=15764236469&g_ipAddress=192.168.2.2&location=116.342599%2C40.064792&ServiceProvider=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&GPS_LatLng=116.342599%2C40.064792&__d=d14ryS1fFUBzfepnq%2FZ6TTGu4FL5BflWngM1OVdPwqYeNZW4%2FZM5HpHJlnwAZPd5UyoGAl5Xrhjtgyf9WtWEOB%2Bni%2FaZle7FikprqPj4izDd5Y64bArJqMndq0Z6x14eK17f&__v=ios5.8&realtime_cart=0&g_version=3.60&timestamp=1478344884384816&token=612a08e73e485490562997fa6daa80c7" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"ggggggg");
        
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
