//
//  ConocimientosViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/25/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class ConocimientosViewController: BaseViewController
{
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var conocimTV: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setHideNavigationBar(hidden: true)
        self.tituloLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 26.0) : UIFont.boldSystemFont(ofSize: 31.0)
        self.conocimTV.text = self.json()
    }

    @IBAction func cerrarBtn(_ sender: Any)
    {
        self.btnLeftAction()
    }
    
    func json() -> String
    {
        var contenido : String = ""
        let url = Bundle.main.url(forResource: "ConocimientosTec", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let JSON = try! JSONSerialization.jsonObject(with: data, options: [])
        if let jsonArray = JSON as? [[String: Any]]
        {
            for item in jsonArray
            {
                contenido = item["conoc"] as? String ?? "No data" //A default value
            }
        }
        return contenido
    }
}
