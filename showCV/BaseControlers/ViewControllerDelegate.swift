//
//  ViewControllerDelegate.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/23/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerDelegate: NSObject
{

    var windowPricipal: UIWindow?
    var viewController: ViewController?
    var splashView:UIView?
    
    init(window:UIWindow?, application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    {
        super.init()
        self.windowPricipal = window
        self.viewController = ViewController()
    }
}

