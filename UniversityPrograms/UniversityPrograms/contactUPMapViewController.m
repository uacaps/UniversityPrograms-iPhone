//
//  contactUPMapViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/18/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "contactUPMapViewController.h"

@interface contactUPMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *contactMapView;
@property float lat;
@property float lng;
@end

@implementation contactUPMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Map";
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    if(self.lat&&self.lng){
        region.center.latitude = self.lat;
        region.center.longitude = self.lng;
        region.span.longitudeDelta = 0.002;
        region.span.latitudeDelta = 0.002f;
    }
    else{
        region.center.latitude = 32.67606;
        region.center.longitude = -86.76078;
        region.span.longitudeDelta = 4.2f;
        region.span.latitudeDelta = 3.9f;
    }
    
    self.contactMapView.mapType = MKMapTypeHybrid;
    [self.contactMapView setRegion:region animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:@"700 University Boulevard Tuscaloosa, AL 35487" completionHandler:^(NSArray *placemarks, NSError *error) {
        if(placemarks){
            
            MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc]init];
            CLPlacemark *placemark = placemarks[0];
            pointAnnotation.coordinate = placemark.location.coordinate;
            pointAnnotation.title = @"University Programs";
            pointAnnotation.subtitle=@"Russell Hall -  Room 236";
            
            
            [self.contactMapView addAnnotation:pointAnnotation];
            
            MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
            region.center.latitude = placemark.location.coordinate.latitude;
            self.lat = placemark.location.coordinate.latitude;
            region.center.longitude = placemark.location.coordinate.longitude;
            self.lng = placemark.location.coordinate.longitude;
            
            region.span.longitudeDelta = 0.002f;
            region.span.latitudeDelta = 0.002f;
            
            [self.contactMapView setRegion:region animated:YES];
            [self.contactMapView selectAnnotation:pointAnnotation animated:YES];
            
        }
    }];
    //MKAnnotationView *annotationView = [[MKAnnotationView alloc] init];
    //MKAnnotation *annotation = [[MKAnnotation alloc] init];
    // Do any additional setup after loading the view from its nib.
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@""];
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.frame = CGRectMake(0, 0, 30, 30);
    annotationView.image = [UIImage imageNamed:@"MapPin"];
    
    
    
    return annotationView;
}
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSURL *mapURL = [NSURL URLWithString:@"http://maps.apple.com/?daddr=700+University+Boulevard+Tuscaloosa,+AL+35487"];
    [[UIApplication sharedApplication] openURL:mapURL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
