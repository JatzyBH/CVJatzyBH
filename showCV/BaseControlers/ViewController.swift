//
//  ViewController.swift
//  
//  showCV
//
//  Created by Jatziry Barrera on 6/20/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    fileprivate lazy var delegate = UIApplication.shared.delegate as? AppDelegate
    fileprivate var _navigation: UINavigationController?
    fileprivate lazy var dicViewControllers:[NameView: BaseViewController?]? = [:]
     var windowPricipal: UIWindow?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        showNavigationViewController(.bienvenida)
    }
    
    func showViewController(_ name: NameView, bundle: BundleParameters? = nil)
    {
        let strClass = self.getClassWhithNameProject(name.getClassName())
        
        if let _ = NSClassFromString(strClass) as? BaseViewController.Type {
            let storyboard = UIStoryboard(name: name.getStoryboard(), bundle: nil)
            
            if let instanceVC = storyboard.instantiateViewController(withIdentifier: name.getClassName()) as? BaseViewController {
                instanceVC.nameLayer = name
                instanceVC.viewController = self
                instanceVC.bundle = bundle
                
                self.dicViewControllers?[name] = instanceVC
                
                if let delegate = UIApplication.shared.delegate as? AppDelegate {
                    if let rootNavigationViewController = delegate.window?.rootViewController as? UINavigationController {
                        rootNavigationViewController.present(instanceVC, animated: true) {
                            //self.delegate!.nexoInicioDelegate?.removeSnapshot()
                        }
                    }
                    else {
                        print("No existe en navigation bar")
                    }
                }
            }
        }
    }
    
    func showNavigationViewController(_ name: NameView, anyObject: AnyObject? = nil)
    {
        let strClass = self.getClassWhithNameProject(name.getClassName())
        
        if let _ = NSClassFromString(strClass) as? BaseViewController.Type {
            let storyboard = UIStoryboard(name: name.getStoryboard(), bundle: nil)
            
            if let instanceVC = storyboard.instantiateViewController(withIdentifier: name.getClassName()) as? BaseViewController {
                instanceVC.nameLayer = name
                instanceVC.viewController = self
                
                if let object = anyObject { instanceVC.bundleObject = object }
                
                self.dicViewControllers?[name] = instanceVC
                
                if let object = anyObject {
                    self.dicViewControllers?[name]??.bundleObject = object
                }
                
                if let delegate = UIApplication.shared.delegate as? AppDelegate {
                    if let rootNavigationViewController = delegate.window?.rootViewController as? UINavigationController {
                        rootNavigationViewController.pushViewController(viewController: instanceVC, animated: true) {
                            //self.delegate!.nexoInicioDelegate?.removeSnapshot()
                        }
                    }
                    else {
                        print("No existe en navigation bar")
                    }
                }
            }
        }
    }
    
    func showNavigationViewController(_ name: NameView, bundle: BundleParameters)
    {
        let strClass = self.getClassWhithNameProject(name.getClassName())
        
        if let _ = NSClassFromString(strClass) as? BaseViewController.Type {
            let storyboard = UIStoryboard(name: name.getStoryboard(), bundle: nil)
            
            if let instanceVC = storyboard.instantiateViewController(withIdentifier: name.getClassName()) as? BaseViewController {
                
                instanceVC.nameLayer = name
                instanceVC.bundle = bundle
                instanceVC.viewController = self
                
                self.dicViewControllers?[name] = instanceVC
                
                if let delegate = UIApplication.shared.delegate as? AppDelegate {
                    if let rootNavigationViewController = delegate.window?.rootViewController as? UINavigationController {
                        rootNavigationViewController.pushViewController(viewController: instanceVC, animated: true) {
                            //self.delegate!.nexoInicioDelegate?.removeSnapshot()
                        }
                    }
                    else {
                        print("No existe en navigation bar")
                    }
                }
            }
        }
    }

    /////////////////////////////////////////////////////////////////
    //////////////////////// COMPORTAMIENTO /////////////////////////
    /////////////////////////////////////////////////////////////////
    
    func getVcFromName(_ name: NameView) -> BaseViewController? {
        return self.dicViewControllers?[name] ?? nil
    }
    
    func releaseVcFromName(_ name: NameView) {
        self.dicViewControllers?[name] = nil
        self.dicViewControllers?.removeValue(forKey: name)
    }
    
    var getAllViewControllers: [NameView : BaseViewController?]? {
        return self.dicViewControllers
    }
    
    fileprivate func getClassWhithNameProject(_ name: String) -> String
    {
        let getNameProject: String = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        return String(format: "%@.%@", arguments: [getNameProject, name])
    }
    
    /**
     Asigna el controlador inicial de la aplicación
     - parameters:
     - viewController: La vista que se lanzara al inicio de la aplicación.
     */
    func makeNavigationViewController(controller: UIViewController? = nil) -> UINavigationController?
    {
        _navigation = _navigation ?? UINavigationController(rootViewController: controller ?? self)
        
        _navigation?.navigationBar.barStyle             = .default
        _navigation?.navigationBar.barTintColor         = UIColor(rgb: 0x43A047)
        _navigation?.navigationBar.shadowImage          = UIImage(named: "fix_back")
        _navigation?.navigationBar.titleTextAttributes  = [.foregroundColor: UIColor.white]
        _navigation?.navigationBar.tintColor            = .white
        _navigation?.navigationBar.isTranslucent        = false
        _navigation?.navigationBar.isOpaque             = false
        
        _navigation?.toolbar.tintColor          = UIColor(rgb: 0x43A047)
        _navigation?.toolbar.barTintColor       = UIColor(rgb: 0x43A047)
        _navigation?.toolbar.isOpaque           = false
        
        _navigation?.isNavigationBarHidden = true
        
        return _navigation
    }
    
}

