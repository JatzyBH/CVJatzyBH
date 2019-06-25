//
//  ExperienciaViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/24/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

struct CustomEmpresaData
{
    var nom : String
    var logo : UIImage
    var direc : String
    var resp : String
    var tel : String
    var dura : String
    var puesto : String
    var actividades : String
}

class ExperienciaViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate
{
    let dataEmpresas =
        [
            CustomEmpresaData(nom: "LionGroup MX", logo: #imageLiteral(resourceName: "lionGroup"), direc: "Blvd. Solidaridad las Torres 576A, San Francisco Coaxusco.\nMetepec, Méx.", resp: "Ing. Guillermo Hernández Hernández \rCEO Specialist RA & RV.", tel: "(722) 706 96 77", dura: "Febrero/2017 – Febrero/2018", puesto: "Desarrollador iOS", actividades: "● Desarrollo de las aplicaciones móviles iOS: \n\t ○ Campus Party 2017 .- Aplicación tipo red social, desarrollada en equipo.\n\t ○ Metepec .- Aplicación informativa con RA y beacons (sensores de proximidad) en tienda.\n\t ○ Grupo Destinos Eventos .- Aplicación informativa e interactiva con el usuario y las actividades del evento.\n\n● Apoyo como programador de JavaScript / php para desarrollo de paginas web."),
            CustomEmpresaData(nom: "BBVA", logo: #imageLiteral(resourceName: "bbva"), direc: "Calz. Gral. Mariano Escobedo 303, Granada. \nCiudad de México, 11520", resp: "Ing. Carlos E. Sardi Reyna \nScrum Master", tel: "55 6068 0934", dura: "Febrero/2018 – Actualidad", puesto: "Desarrollador iOS", actividades: "● Actualización de aplicación iOS tipo API:\n\t○ Cuentas Digitales (Bancomer) .- API integrada en la aplicación Bancomer móvil y BBVA Send para la creación de cuentas digitales en el banco. \n\n● Mantenimiento y desarrollo de aplicación iOS:\n\t ○ BBVA Send .- Aplicación actualmente en tienda para transacciones bancarias. \n\n● Integración y pruebas de SDK de seguridad para prevención de fraudes en iOS."),
            CustomEmpresaData(nom: "HSBC", logo: #imageLiteral(resourceName: "HSBC"), direc: "Zona Industrial, Av. Robert Bosch s/n esq. Industrial, 50500\nToluca de Lerdo, Méx.", resp: "Ing. XXXXX \nLíder de proyecto", tel: "01 722 275 0618", dura: "Julio/2019 – .....", puesto: "Desarrollador iOS", actividades: "● Desarrollo, documentación y mantenimiento de aplicaciones móviles iOS. \n\t ○ HSBC.- Aplicación de transacciones bancarias y atención al cliemte.")
            
    ]
    
    fileprivate let empresasExp: UICollectionView =
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let baseCollectionV = UICollectionView (frame: .zero, collectionViewLayout: layout)
        //baseCollectionV.decelerationRate = UIScrollView.DecelerationRate.fast
        baseCollectionV.translatesAutoresizingMaskIntoConstraints = false
        baseCollectionV.register(EmpresaCollectionViewCell.self, forCellWithReuseIdentifier: "empresaCell")
        return baseCollectionV
    }()
    
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var empresasPageControl: UIPageControl!
    var timer = Timer()
    var count = 1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(empresasExp)
        empresasExp.backgroundColor = .clear
        
        empresasExp.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        empresasExp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        empresasExp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        empresasExp.bottomAnchor.constraint(equalTo: empresasPageControl.topAnchor, constant: 0).isActive = true
        
        empresasExp.isPagingEnabled = true
        empresasExp.dataSource = self
        empresasExp.delegate = self
        
        empresasPageControl.isUserInteractionEnabled = false
        self.empresasPageControl.numberOfPages = dataEmpresas.count
        self.empresasPageControl.currentPage = 0
        
        self.setHideNavigationBar(hidden: true)
        self.tituloLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        
        DispatchQueue.main.async
        {
            self.timer = Timer.scheduledTimer(timeInterval: 4.0, target : self, selector: #selector(self.changeEmpresa), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func changeEmpresa ()
    {
        if count < dataEmpresas.count
        {
            let index = IndexPath.init(item: count, section: 0)
            self.empresasExp.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            count += 1
        } else
        {
            count = 0
            let index = IndexPath.init(item: count, section: 0)
            self.empresasExp.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
        self.empresasPageControl.currentPage = count
        
    }
    
    @IBAction func cerrarBtn(_ sender: Any)
    {
        self.btnLeftAction()
        //self.viewController?.showNavigationViewController(.menuPrincipal)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {   return dataEmpresas.count   }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "empresaCell", for: indexPath) as! EmpresaCollectionViewCell
        cell.backgroundColor = .clear
        cell.data = self.dataEmpresas[indexPath.row]
        self.empresasPageControl.currentPage = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFont
    {
        return 0 as! CGFont
    }
    
    /*override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        var visibleRect = CGRect()
        visibleRect.origin = (empresasExp?.contentOffset)!
        visibleRect.size = (empresasExp?.bounds.size)!
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = empresasExp?.indexPathForItem(at: visiblePoint) else { return }
        
        self.delegateCollPendientes?.currentPosit
        ionScrollView(position: indexPath.item)
    }
    */
}
