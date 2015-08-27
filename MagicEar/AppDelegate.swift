//
//  AppDelegate.swift
//  MagicEar
//
//  Created by bijiabo on 15/8/16.
//  Copyright © 2015年 JYLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var downloader : MiiDownloader!
    var player : PlayerManager!
    
    //演示用播放数据
    let PlayerResources : [String] = [
        "YouAreMySunShine.m4a", //玩耍
        "irmujeho.4va.mp3", //午后
        "rmei52zo.sjq.mp3", //睡前
        "33nerci4.fz0.mp3" //起床
    ]
    var playing : Bool = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        downloader = MiiDownloader()
        NSURLProtocol.registerClass(MiiNSURLProtocol )
        optimizeWebkitMemory()
        
        let navigationController : GlobalNavigationController = GlobalNavigationController()
        navigationController.viewControllers = [ UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("playScrollViewController") ]
        
        window?.rootViewController? = navigationController
        
        initPlayer()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func optimizeWebkitMemory() {
        let cacheSizeMemory : Int = 4*1024*1024; // 4MB
        let cacheSizeDisk : Int = 32*1024*1024; // 32MB
        let sharedCache : NSURLCache = NSURLCache(memoryCapacity: cacheSizeMemory, diskCapacity: cacheSizeDisk, diskPath: "nsurlcache")
        NSURLCache.setSharedURLCache(sharedCache)
    }

}

