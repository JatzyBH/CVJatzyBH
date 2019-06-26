//
//  MuestraDatosArchivoViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/25/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class MuestraDatosArchivoViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var titLbl: UILabel!
    @IBOutlet weak var datostblV: UITableView!
    var datosIngresados = [DatosIngresados]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setHideNavigationBar(hidden: true)
        self.titLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        self.datostblV.dataSource = self
        self.datostblV.delegate = self
        self.datostblV.register(CustomDataCell.self, forCellReuseIdentifier: "datosCell")
        self.bundle = self.bundle ?? BundleParameters()
        if let datosReg : [DatosIngresados] = (self.bundle?.get("allData"))! as [DatosIngresados]
        {
            self.datosIngresados = datosReg
        }
        //var datosIngresados =
        self.datostblV.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosIngresados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datosCell", for: indexPath) as! CustomDataCell
        cell.backgroundColor = .clear
        cell.data = self.datosIngresados[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        cell.contentView.layer.masksToBounds = true
                // if you do not set `shadowPath` you'll notice laggy scrolling // add this in `willDisplay` method let radius = cell.contentView.layer.cornerRadius cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.bienvenida)
    }
}


