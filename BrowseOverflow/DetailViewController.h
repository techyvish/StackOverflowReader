//
//  DetailViewController.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 27/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
