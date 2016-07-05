//
//  ViewController.m
//  ExternalFont
//
//  Created by baishiqi on 15/10/5.
//  Copyright (c) 2015年 baishiqi. All rights reserved.
//

#import "ViewController.h"

#define LABEL_TEXT      @"测试外部字体"
#define LABEL_FONT_NAME @"HiraginoSansGB-W3"
#define LABEL_FONT_SIZE 20

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pLabel;

@end

@implementation ViewController

/*
 使用外部字体
 1. 先将外部字体文件（.ttf或.otf）引入工程，看Build Phases-->Copy Bundle Resources中是否有字体文件，没有的话加上
 2. 在Info.plist文件中加入一项“Fonts provided by application” ，数组类型，其中增加两项，填入引入的字体文件全名*.ttf或*.otf
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pLabel.text = LABEL_TEXT;
    
    UIFont *font = [UIFont fontWithName:LABEL_FONT_NAME size:LABEL_FONT_SIZE];
    
    self.pLabel.font = font;

    [self scanFonts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scanFonts {
    // 字系
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    // 字体
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily) {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont) {
            NSLog(@"  Font name: %@",[fontNames objectAtIndex:indFont]);
        }
    }
}

@end
