//  ProgressHUD.m
//
//  Created by Pierre-Emmanuel Bois on 23/09/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

#import <Cordova/CDV.h>
#import "ProgressHUD.h"
#import "MBProgressHUD.h"

@implementation ProgressHUD

@synthesize progressHUD;

- (void)show:(CDVInvokedUrlCommand*)command
{
	NSString* message = [command argumentAtIndex:0];
	NSString* messageLong = [command argumentAtIndex:0];

	self.progressHUD = nil;
	self.progressHUD = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
	self.progressHUD.mode = MBProgressHUDModeAnnularDeterminate;
	self.progressHUD.progress = 0;
    self.progressHUD.labelText = message;
    self.progressHUD.detailsLabelText = messageLong;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setValue:(CDVInvokedUrlCommand*)command
{
	NSString* aValue = [command argumentAtIndex:0];

	if (!self.progressHUD) {
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}
	[self.progressHUD progress:aValue];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)hide:(CDVInvokedUrlCommand*)command
{
	if (!self.progressHUD) {
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}
	[self.progressHUD hide:YES];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
