//
//  GifMeViewController.m
//  GifMe
//
//  Created by Sydney Richardson on 12/16/14.
//  Copyright (c) 2014 Sydney Richardson. All rights reserved.
//

#import "GifMeViewController.h"
#import <CoreImage/CoreImage.h>

@interface GifMeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
- (IBAction)durationStepper:(id)sender;
- (IBAction)createGif:(id)sender;

@property (strong, nonatomic) NSMutableArray *images;

@end

@implementation GifMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = [[NSMutableArray alloc] init];
    
    NSLog(@"getting the image from the file path and adding it to the images array");
    for (int i = 1; i < 10; i++) {
        NSString *imageName = [[NSString alloc] initWithFormat:@"Meghan_%i", i];
        
        [self.images addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"]]];
    }
    
    
}

- (IBAction)durationStepper:(id)sender {
    // update the duration lable to match the current value of the stepper
    self.durationLabel.text = [NSString stringWithFormat:@"Gif Duration: %f sec", [self.stepper value]];
    
}
- (IBAction)createGif:(id)sender {
    // creating gif image
    NSLog(@"Gif-ifying the images");
    UIImage *imageToDisplay = [self jifme];
    // setting image to the view
    NSLog(@"Gif image: %@", imageToDisplay);
    NSLog(@"setting the image to the view");
    self.imageView.image = imageToDisplay;
}

- (UIImage *)jifme
{
    // factory method br0
    // get the images from the file and put them into the array
    // return peanutbutter
    return [UIImage animatedImageWithImages:self.images duration:[self.stepper value]];
}
@end