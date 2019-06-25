//
//  BaseViewController.swift
//  Clase encargada de asignar caracteristicas y declarar funciones genericas del proyecto.
//  showCV
//
//  Created by Jatziry Barrera on 6/21/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController
{
    fileprivate lazy var _queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
    fileprivate var _rightButton: UIButton?
    fileprivate var _leftButton: UIButton?
    
    var keyboardToolbar: UIToolbar?
    var acceptBarButton: UIBarButtonItem?
    var cancelBarButton: UIBarButtonItem?
    var doneBarButton: UIBarButtonItem?
    var flexBarButton: UIBarButtonItem?
    
    var nameLayer: NameView!
    var bundle: BundleParameters?
    var bundleObject: AnyObject?
    
    var viewController: ViewController?
    
    var screenBounds: CGRect
    {   return UIScreen.main.bounds }

    required init(nibName nibNameOrNil: String?,
                  nameVC principalViewsController: ViewController?,
                  refPantalla: NameView)
    {
        super.init(nibName: nibNameOrNil, bundle: nil)
        self.nameLayer = refPantalla
        self.viewController = principalViewsController
    }
    
    required init?(coder aDecoder: NSCoder)
    {   super.init(coder: aDecoder) }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        let center: NotificationCenter = NotificationCenter.default
        center.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        if self.view.window == nil
        {   self.setValue(nil, forKey: "view")  }
    }
    
    func addRightButtonsNavigationBar(nameImage: String, title: String)
    {
        _rightButton = UIButton(type: .system)
        _rightButton?.setBackgroundImage(UIImage(named: nameImage), for: .normal)
        _rightButton?.addTarget(self, action: #selector(btnRightAction), for: .touchUpInside)
        
        let barItem01Button = UIBarButtonItem(customView: _rightButton!)
        let barItem02Button = UIBarButtonItem(title: title, style: .plain,
                                              target: self, action: #selector(btnRightAction))
        
        self.navigationItem.rightBarButtonItems = [barItem01Button, barItem02Button]
    }
    
    func addRightButtonNavitagionBar(nameImage: String)
    {
        _rightButton = UIButton(type: .system)
        _rightButton?.setBackgroundImage(UIImage(named: nameImage), for: .normal)
        _rightButton?.addTarget(self, action: #selector(btnRightAction), for: .touchUpInside)
        
        let barItem01Button = UIBarButtonItem(customView: _rightButton!)
        self.navigationItem.rightBarButtonItem = barItem01Button
    }
    
    func addLeftButtonNavitagionBar(nameImage: String)
    {
        _leftButton = UIButton(type: .system)
        _leftButton?.setBackgroundImage(UIImage(named: nameImage), for: .normal)
        _leftButton?.addTarget(self, action: #selector(btnLeftAction), for: .touchUpInside)
        
        let barItem01Button = UIBarButtonItem(customView: _leftButton!)
        self.navigationItem.leftBarButtonItem = barItem01Button
    }
    
    func addLeftButtonsNavigationBar(title: String)
    {
        let barItem02Button = UIBarButtonItem(title: title, style: .done,
                                              target: self, action: #selector(btnLeftAction))
        self.navigationItem.leftBarButtonItems = [barItem02Button]
    }
    
    /**
     Método de acción del botón superior derecho.
     **/
    @objc func btnRightAction()
    {
    }
    
    /**
     Método de acción del botón superior izquierdo.
    **/
    @objc func btnLeftAction()
    {
        print("Voy para la pantalla anterior")
        self.navigationController?.popViewController(animated: true)
    }
    
    func showNavigationBar()
    {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = String.Empty
    }
    
    func setTitleNavigationBar(title: String)
    {
        self.navigationItem.title = title
    }
    
    func setHideNavigationBar(hidden: Bool)
    {   self.navigationController?.isNavigationBarHidden = hidden}
    
    /**
     Crea un mensaje de error con titulo, mensaje, titulo del botón y acción.
     - parameters:
     - titleMsj: El titulo que se mostrara en la alerta.
     - mensajeDesplegar: El mensaje que se mostrara en el alert de error.
     - btnTitle: El titulo que se mostrara en el boton.
     - handler: El evento que se ejecutara al clickear el boton.
     **/
    func mensajeError(mensaje titleMsj: String, mensajeDesplegar: String, btnTitle: String, handler: @escaping (UIAlertAction) -> Void)
    {
        let alert = UIAlertController(title: titleMsj, message: mensajeDesplegar, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     Crea un mensaje de error con titulo y mensaje especifico.
     - parameters:
     - mensajeDesplegar: El mensaje que se mostrara en el alert de error.
     - titleMsj: El titulo que se mostrara en la alerta.
     - handler: El evento que se ejecutara al clickear el boton.
     **/
    func mensajeError(mensaje titleMsj: String, mensajeDesplegar: String)
    {
        let alert = UIAlertController(title: titleMsj, message: mensajeDesplegar, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Aceptar",
                                                               comment: String.Empty),
                                      style: .default) { _ in
                                        alert.dismiss(animated: true, completion: nil)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func addDoneButtonTo(_ textField: UITextField, titles: [String]? = nil)
    {
        var cancelar = "Cancelar"
        var done = "Aceptar"
        
        if let listTitles = titles {
            cancelar = listTitles.first ?? "Cancelar"
            done = listTitles.last ?? "Aceptar"
        }
        
        let cancelBarButton = UIBarButtonItem(title: cancelar, style: .done,
                                              target: self, action: #selector(didTapButton(_:)))
        cancelBarButton.tag = 1
        cancelBarButton.tintColor = .white
        
        let doneBarButton = UIBarButtonItem(title: done, style: .done,
                                            target: self, action: #selector(didTapButton(_:)))
        doneBarButton.tag = 2
        doneBarButton.tintColor = .white
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        
        let keyboardToolbar = UIToolbar()
        
        keyboardToolbar.sizeToFit()
        keyboardToolbar.barStyle = .blackTranslucent
        keyboardToolbar.backgroundColor = UIColor.fromHex(rgbValue: 0x6754B8)
        keyboardToolbar.items = [cancelBarButton, flexBarButton, doneBarButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    @objc func didTapButton(_ sender: UIBarButtonItem?)
    {
        
    }
    
    @objc func keyboardWillAppear(_ notification:Notification)
    {
        if let info = notification.userInfo {
            let keyboardRect: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            var valorY = 0  - keyboardRect.size.height + keyboardRect.size.height
            if self.isIphone() == "SE"
            {
                valorY = -40
            }
            let newRect:CGRect = CGRect(x: self.view.frame.origin.x,
                                        y: valorY, //self.view.frame.origin.y
                width: self.view.frame.size.width,
                height: self.view.frame.size.height)
            let seconds:TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            
            UIView.animate(withDuration: seconds, animations: { () -> Void in
                self.view.frame = newRect
            })
        }
        
    }
    
    @objc func keyboardWillDisappear(_ notification: Notification)
    {
        if let info = notification.userInfo
        {
            let seconds:TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            var posY:CGFloat = 0.0
            
            if let navbarFrame = self.navigationController?.navigationBar.frame {
                let topHeight = navbarFrame.size.height + navbarFrame.origin.y
                
                posY = topHeight
            }
            
            let oldFrame:CGRect = CGRect(x: 0,
                                         y: 0,
                                         width: self.view.frame.size.width,
                                         height: self.view.frame.size.height)
            
            UIView.animate(withDuration: seconds, animations: { () -> Void in
                self.view.frame = oldFrame
            })
        }
    }

    
    func removeReferenceContext()
    {
        self.bundleObject = nil
        self.acceptBarButton = nil
        self.cancelBarButton = nil
        self.doneBarButton = nil
        self.flexBarButton = nil
        
        self.keyboardToolbar?.removeFromSuperview()
        self.keyboardToolbar = nil
        
        self.viewController?.releaseVcFromName(self.nameLayer)
        self.viewController = nil
        self.bundle = nil
        
        self.removeFromParent()
    }
    
    
    func isIphone () -> String
    {
        var result : String = String.Empty
        let screenHeight = UIScreen.main.bounds.size.height
        let nativeBounds = UIScreen.main.nativeBounds.height
        
        switch screenHeight
        {
        case 568:
            if nativeBounds == 1136
            {   print("IPHONE 5,5S,5C")
                result = "SE"
            }
            break
        case 667:
            if nativeBounds == 1334
            {   print("IPHONE 6,7,8 IPHONE 6S,7S,8S ")
                result = "Normal"
            }
            break
        case 736:
            if (nativeBounds == 1920) || (nativeBounds == 2208)
            {   print("IPHONE 6PLUS, 6SPLUS, 7PLUS, 8PLUS")
                result = "Plus"
            }
            break
        case 812:
            if nativeBounds == 2436
            {   print("IPHONE X, IPHONE XS")
                result = "X"
            }
            break
        case 896:
            if nativeBounds == 2688
            {   print("IPHONE XS_MAX")
                result = "XSMax"
            }
            break
        default:
            result = "nuevo"
            if nativeBounds == 1792
            {   print("IPHONE XR")
                result = "XR"
            }
            
        }
        return result
    }
    
}

extension String
{
    private static var sharedInstance: String
    {
        struct Static
        {   static var instance: String?    }
        
        if Static.instance == nil
        {   Static.instance = String()  }
        
        return Static.instance!
    }
    
    static var Empty: String
    {   return self.sharedInstance  }
}

extension UIColor
{
    class func fromHex(rgbValue: UInt32) -> UIColor
    {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int)
    {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int)
    {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UINavigationController
{
    
    /*
     Get previous view controller of the navigation stack.
     - returns:
     El ViewController anterior.
     */
    func previousViewController() -> UIViewController?
    {
        let lenght = self.viewControllers.count
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
        return previousViewController
    }
    
    
    /// Lanza el pushviewController con un completition.
    ///
    /// - Parameters:
    ///   - viewController: View controller destino.
    ///   - animated: true/false si es animado.
    ///   - completion: El metodo a ejecutar cuando se complete la transaccion.
    func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> ())
    {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    
    /**
     Lanza el pushviewController con un completition.
     */
    func popToViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> ())
    {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /**
     Lanza el pushviewController con un completition.
     */
    func popViewController(animated: Bool, completion: @escaping () -> ())
    {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: true)
        CATransaction.commit()
    }
}

extension UINavigationBar
{
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 90)
    }
}

