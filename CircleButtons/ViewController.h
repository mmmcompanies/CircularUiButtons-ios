//
//  ViewController.h
//  CircleButtons
//
//  Created by Techno Softwares on 21/11/16.
//  Copyright © 2016 madan kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
     CGPoint basePoint;
    int count;
    int BUTTONS_COUNT;
    float circleRadius;
    float curAngle;
    float incAngle;
    float buttonW;
    CGPoint circleCenter;
    NSTimer *timercallmethod;
    NSMutableArray* array; }

@end

