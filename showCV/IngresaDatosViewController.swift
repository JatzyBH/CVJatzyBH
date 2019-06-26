//
//  IngresaDatosViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/25/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit
import CoreData

class IngresaDatosViewController: BaseViewController, UITextFieldDelegate
{
    @IBOutlet weak var titLbl: UILabel!
    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var apPatTF: UITextField!
    @IBOutlet weak var apMatTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var webLblTF: UITextField!
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var anchoView: NSLayoutConstraint!
    @IBOutlet weak var abajoView: NSLayoutConstraint!
    
    var datosIngresados = [DatosIngresados]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setHideNavigationBar(hidden: true)
        self.titLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        self.btnGuardar.layer.cornerRadius = 15
        self.anchoView.constant = self.view.frame.width - 50
        
        self.nomTF.delegate = self
        self.apMatTF.delegate = self
        self.apPatTF.delegate = self
        self.telTF.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard()
    {
        self.nomTF.resignFirstResponder()
        self.apMatTF.resignFirstResponder()
        self.apPatTF.resignFirstResponder()
        self.telTF.resignFirstResponder()
        self.webLblTF.resignFirstResponder()
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.btnLeftAction()
    }
    
    @IBAction func validaGuarda(_ sender: Any)
    {
        if let valida : (esError : Bool, mensaje : String) = validaDatos(self.nomTF.text!, apellidoPat: self.apMatTF.text!, apellidoMat: self.apPatTF.text!, telefono: self.telTF.text!, email: self.webLblTF.text!), valida.esError
        {
            self.mensajeError(mensaje: "Alerta", mensajeDesplegar: valida.mensaje)
            return
        }
        self.bundle = BundleParameters()
        self.guardaDatos()
        self.viewController?.showNavigationViewController(.guardoDatos, bundle: self.bundle!)
    }
    
    
    func guardaDatos ()
    {
        let fetchRequest: NSFetchRequest <DatosIngresados> = NSFetchRequest <DatosIngresados> (entityName: "DatosIngresados")
        
        do {
            let allData = try CoreDataService.context.fetch(fetchRequest)
            self.datosIngresados = allData
        } catch {}
        
        let datosIng = DatosIngresados(context: CoreDataService.context)
        datosIng.nombreS = self.nomTF.text!
        datosIng.apellPat = self.apMatTF.text!
        datosIng.apellMat = self.apPatTF.text!
        datosIng.telef = self.telTF.text!
        datosIng.email = self.webLblTF.text!    //Int16(self.webLblTF.text!)!
        CoreDataService.saveContext()
        self.datosIngresados.append(datosIng)
        self.bundle?.add(datosIng, key: "newData")
        self.bundle?.add(self.datosIngresados, key: "allData")
    }
    
}
