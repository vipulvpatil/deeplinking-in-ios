//
//  DLAppDelegate.m
//  deeplink
//
//  Created by Vipul on 19/03/14.
//  Copyright (c) 2014 Originate. All rights reserved.
//

#import "DLAppDelegate.h"
#import "DLViewController.h"
#import "Page1ViewController.h"
#import "Page2ViewController.h"
#import "Page3ViewController.h"

@implementation DLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  DLViewController *mainViewController = [[DLViewController alloc] init];
  self.mainController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
  self.window.rootViewController = self.mainController;
  [self.window makeKeyAndVisible];
  return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
  if([[url host] isEqualToString:@"page"]){
    if([[url path] isEqualToString:@"/main"]){
      [self.mainController setViewControllers:@[[[DLViewController alloc] init]] animated:YES];
    }
    else if([[url path] isEqualToString:@"/page1"]){
      [self.mainController pushViewController:[[Page1ViewController alloc] init] animated:YES];
    }
    else if([[url path] isEqualToString:@"/page2"]){
      [self.mainController pushViewController:[[Page2ViewController alloc] init] animated:YES];
    }
    else if([[url path] isEqualToString:@"/page3"]){
      [self.mainController pushViewController:[[Page3ViewController alloc] init] animated:YES];
    }
  }
  return YES;
}

@end
