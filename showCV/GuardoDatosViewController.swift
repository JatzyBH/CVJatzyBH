//
//  GuardoDatosViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/25/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class GuardoDatosViewController: BaseViewController
{
    @IBOutlet weak var titLbl: UILabel!
    @IBOutlet weak var imgPerfilIV: UIImageView!
    @IBOutlet weak var nomLbl: UILabel!
    @IBOutlet weak var telLbl: UILabel!
    @IBOutlet weak var btnSiguiente: UIButton!
    @IBOutlet weak var mailLbl: UILabel!
    @IBOutlet weak var anchoView: NSLayoutConstraint!
    @IBOutlet weak var altoImg: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setHideNavigationBar(hidden: true)
        self.titLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        self.btnSiguiente.layer.cornerRadius = 15
        self.anchoView.constant = self.view.frame.width - 50
        self.altoImg.constant =  self.anchoView.constant / 2
        
        self.bundle = self.bundle ?? BundleParameters()
        if let datosNuevos : DatosIngresados = (self.bundle?.get("newData"))! as DatosIngresados
        {
            self.nomLbl.text = "\(datosNuevos.nombreS!) \(datosNuevos.apellPat!) \(datosNuevos.apellMat!)"
            self.telLbl.text = datosNuevos.telef!
            self.mailLbl.text = datosNuevos.email!
        }
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.bienvenida)
    }
    
    @IBAction func showData(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.muestrainf, bundle: self.bundle!)
    }
}
