//
//  SummaryViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/22/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class SummaryViewController: BaseViewController
{
    @IBOutlet weak var titLbl: UILabel!
    @IBOutlet weak var resumenTV: UITextView!
    @IBOutlet weak var fotoImgV: UIImageView!
    @IBOutlet weak var sigBtn: UIButton!
    
    @IBOutlet weak var ext1: UILabel!
    @IBOutlet weak var ext2: UILabel!
    @IBOutlet weak var ext3: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setHideNavigationBar(hidden: true)
        self.titLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        
        self.fotoImgV.image = #imageLiteral(resourceName: "foto")
        let radius = self.fotoImgV.frame.width / 2
        self.fotoImgV.layer.cornerRadius = radius
        self.fotoImgV.layer.masksToBounds = true
        
        self.resumenTV.text = Informacion.resumen
        
        self.ext1.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 12.0) : UIFont.boldSystemFont(ofSize: 17.0)
        self.ext2.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 12.0) : UIFont.boldSystemFont(ofSize: 17.0)
        self.ext3.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 12.0) : UIFont.boldSystemFont(ofSize: 17.0)
        
        self.sigBtn.layer.cornerRadius = 15
        
    }

    @IBAction func masInformacion(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.menuPrincipal)
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.btnLeftAction()
    }
    
}
