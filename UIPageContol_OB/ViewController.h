//
//  ViewController.h
//  UIPageContol_OB
//
//  Created by JuneK on 01/09/2019.
//  Copyright © 2019 JuneK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterView/CenterView.h"

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic)NSMutableArray *centerViews;

@end

