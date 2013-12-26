//
//  HomeViewController.m
//  DrinkingParty
//
//  Created by 上の 敏司 on 13/10/25.
//  Copyright (c) 2013年 上の 敏司. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

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
    //DBファイルのパス
    
    //DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:@"/Users/NEK/Programing/DrinkingParty/iPhoneAppDatabase.db"])
    {
        NSLog(@"なかった");
        //NSLog(@"path:%@", [dir stringByAppendingPathComponent:@".db"]);
    
        
        //なければ新規作成
        //FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"/Users/NEK/Programing/DrinkingParty/iPhoneAppDatabase.db"]];
        //NSString *sql = @"CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT,testname TEXT);";
        /*
        [db open]; //DB開く
        [db executeUpdate:sql]; //SQL実行
        [db close]; //DB閉じる

        //なければ新規作成
        //FMDatabase *db= [FMDatabase databaseWithPath:@"/iPhoneAppDatabase.db"];
        //[db open]; //DB開く
        //[db close]; //DB閉じる
        */
    }
        
    FMDatabase *db = [FMDatabase databaseWithPath:@"/Users/NEK/Programing/DrinkingParty/iPhoneAppDatabase.db"];
    NSString *sql = @"SELECT name FROM themeTable;";
    [db open]; //DB開く
    FMResultSet *results = [db executeQuery:sql,1];
    NSMutableArray* theme = [[NSMutableArray alloc] initWithCapacity:0];
    while( [results next])
    {
        NSLog(@"%@", [results stringForColumn:@"name"]);
        
    }
    [db close]; //DB閉じる
    
    
     //NSLog(@"外きた");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
