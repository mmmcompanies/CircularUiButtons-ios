//
//  ViewController.m
//  CircleButtons
//
//  Created by Techno Softwares on 21/11/16.
//  Copyright © 2016 madan kumawat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    basePoint = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
     BUTTONS_COUNT = 12;
    count = 0;
//    NSArray *buttons = [[NSArray alloc] initWithObjects:button1,button2,button3,nil];
     circleRadius = 200; /* given radius */
     curAngle = 0;
     incAngle = ( 360.0/(BUTTONS_COUNT) )*M_PI/180.0;
     buttonW = (circleRadius/BUTTONS_COUNT)*5.5;
     circleCenter = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);/* given center */
    
//    [self performSelector:@selector(createButton) withObject:self afterDelay:5.0 ];
    array = [NSMutableArray new];
    

    
   
    timercallmethod = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(createButton) userInfo:nil repeats:YES];
    
}
- (void)createButton{

//    for (int i = 0; i < BUTTONS_COUNT; i++)
//    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonW, buttonW)];
        CGPoint buttonCenter;
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(moveButton:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = buttonW/2;
        button.tag = count;
        buttonCenter.x = circleCenter.x + cos(curAngle)*circleRadius;
        buttonCenter.y = circleCenter.y + sin(curAngle)*circleRadius;
        button.transform = CGAffineTransformRotate(button.transform, curAngle);
    
    
        button.center = buttonCenter;
    
        [self.view addSubview:button];
     [array addObject:[NSValue valueWithCGRect:button.frame]];
    
        curAngle += incAngle;
        count++;
    if (count==BUTTONS_COUNT)
    {
         [timercallmethod invalidate];
    }
//    }

}

- (void)moveButton:(UIButton *)btn
{
    [UIView animateWithDuration:1.0 animations:^{
        
        CGPoint center = btn.center;
        bool equl = CGPointEqualToPoint(basePoint, center);
        if (equl) {
            CGRect someRect = [[array objectAtIndex:btn.tag] CGRectValue];
            CGRect buttonframe;
            
            buttonframe.origin.x  = someRect.origin.x;
            buttonframe.origin.y  = someRect.origin.y;
            buttonframe.size.width = buttonW;
             buttonframe.size.height = buttonW;
            btn.frame =buttonframe;
        }
        else
        {
                    btn.center = basePoint;
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
