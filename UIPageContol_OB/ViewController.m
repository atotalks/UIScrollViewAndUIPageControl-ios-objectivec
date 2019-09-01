//
//  ViewController.m
//  UIPageContol_OB
//
//  Created by JuneK on 01/09/2019.
//  Copyright © 2019 JuneK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

-(void)initView {
    int numbersOfPage = 3;
    
    _centerViews = [[NSMutableArray alloc]init];
    
    for(int idx = 0 ; idx < numbersOfPage ; idx++){
        [_centerViews addObject:[NSNull null]];
    }
    
    CGSize contentSize = _scrollView.frame.size;
    contentSize.width = _scrollView.frame.size.width * numbersOfPage;
    
    [_scrollView setContentSize:contentSize];
    [_scrollView setDelegate:self];
    
    [_scrollView setPagingEnabled:YES];
    
    [_scrollView setBounces:NO];
    [_scrollView setScrollsToTop:NO];
    [_scrollView setScrollEnabled:YES];
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    [_pageControl setNumberOfPages:numbersOfPage];
    [_pageControl setCurrentPage:0];
    
    _centerViews = [[NSMutableArray alloc] init];
    
    [_centerViews addObject:@"ar"];
    [_centerViews addObject:@"ml"];
    [_centerViews addObject:@"siri"];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    for (int i = 0; i < 3; i++) {
        CenterView *View = [[[NSBundle mainBundle] loadNibNamed:@"CenterView" owner:nil options:nil] objectAtIndex:0];
        NSString *val = [_centerViews objectAtIndex:i];
        View.imageView.image = [UIImage imageNamed:val];
        
        View.frame = CGRectMake(View.frame.size.width * i, 0, View.frame.size.width, View.frame.size.height);
        [_scrollView addSubview:View];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = _scrollView.frame.size.width;
    _pageControl.currentPage = floor((_scrollView.contentOffset.x - pageWidth / 3) / pageWidth) + 1;
}

@end
