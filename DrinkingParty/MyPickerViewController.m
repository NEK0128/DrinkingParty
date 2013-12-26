//
//  MyPickerViewController.m
//  DrinkingParty
//
//  Created by 上の 敏司 on 13/12/26.
//  Copyright (c) 2013年 上の 敏司. All rights reserved.
//

#import "MyPickerViewController.h"

@interface MyPickerViewController ()

@end

@implementation MyPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // UIPickerのインスタンス化
    _picker = [[UIPickerView alloc] init];
    
    // デリゲートを設定
    _picker.delegate = self;
    
    // データソースを設定
    _picker.dataSource = self;
    
    // 選択インジケーターを表示
    _picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに表示
    [self.view addSubview:_picker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

/**
 * 行のサイズを変更する
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 50.0;
            break;
        case 1: // 2列目
            return 50.0;
            break;
        default:
            return 0;
            break;
    }
}


/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [NSString stringWithFormat:@"%d", row];
            break;
        case 1:
            return [NSString stringWithFormat:@"%d人", row];
            break;
        default:
            break;
    }
}

/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];
    
    // 2列目の選択された行数を取得
    NSInteger val1 = [pickerView selectedRowInComponent:1];
    
    NSLog(@"1列目:%d行目を選択", val0);
    NSLog(@"2列目:%d行目を選択", val1);
}






@end

