//
//  ViewController.m
//  Demo1_JS_NSFileManager
//
//  Created by  江苏 on 16/3/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFileManager* manager=[NSFileManager defaultManager];
    NSString* path=@"/Users/jiangsu/Downloads";
    NSArray* fileNames=[manager contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray* imagePaths=[NSMutableArray array];
    for (NSString* fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]||[fileName hasSuffix:@"JPG"]||[fileName hasSuffix:@"png"]||[fileName hasSuffix:@"PNG"]) {
            NSString* imagePath=[path stringByAppendingPathComponent:fileName];
            [imagePaths addObject:imagePath];
        }
    }
    UIScrollView* scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    for (int i=0; i<imagePaths.count; i++) {
        NSString* imagePath=imagePaths[i];
        UIImage* imagex=[UIImage imageWithContentsOfFile:imagePath];
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i%4*80, i/4*80, 80, 80)];
        imageView.image=imagex;
        [scrollView addSubview:imageView];
    }
    int countLine=imagePaths.count%4==0?(imagePaths.count/4):(imagePaths.count/4+1);
    [scrollView setContentSize:CGSizeMake(0, countLine*80)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
