//
//  PrincipalViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/22/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

struct CustumImageData
{
    var tit : String
    var img : UIImage
    var color: UIColor
}

class PrincipalViewController: BaseViewController
{
    let dataImages =
    [
        CustumImageData(tit: "Contacto", img: #imageLiteral(resourceName: "infPersonal"), color: .red),
        CustumImageData(tit: "Formación Académica ", img: #imageLiteral(resourceName: "infAcademica"),  color: .blue),
        CustumImageData(tit: "Formación Laboral", img: #imageLiteral(resourceName: "infProfesional"),  color: .green),
        CustumImageData(tit: "Personalidad / skills", img: #imageLiteral(resourceName: "infCapacidades"),  color: UIColor.fromHex(rgbValue: 0xEBC464))
        
    ]
    fileprivate let opcionesInfo: UICollectionView =
    {
        let layout = UICollectionViewFlowLayout()
        let baseCollectionV = UICollectionView (frame: .zero, collectionViewLayout: layout)
        baseCollectionV.translatesAutoresizingMaskIntoConstraints = false
        baseCollectionV.register(CustomCell.self, forCellWithReuseIdentifier: "opcionCell")
        return baseCollectionV
    }()
    
    @IBOutlet weak var constAncho: NSLayoutConstraint!
    
    @IBOutlet weak var tituloLbl: UILabel!
    
    @IBOutlet weak var datosSeccionSV: UIStackView!
    @IBOutlet weak var seccionView: UIView!
    @IBOutlet weak var tituloSeccionLbl: UILabel!
    @IBOutlet weak var nombLbl: UILabel!
    @IBOutlet weak var nacLbl: UILabel!
    @IBOutlet weak var sexLbl: UILabel!
    @IBOutlet weak var edoCivLbl: UILabel!
    @IBOutlet weak var dirLbl: UILabel!
    @IBOutlet weak var telefonoLbl: UILabel!
    @IBOutlet weak var webLbl: UILabel!
    
    @IBOutlet weak var infSeccionTV: UITextView!
    @IBOutlet weak var contSeccionTV: UIStackView!
    @IBOutlet weak var imgSeccionImageV: UIImageView!
    
    @IBOutlet weak var siguienteBtn: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setHideNavigationBar(hidden: true)
        self.tituloLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        self.tituloSeccionLbl.font = self.tituloLbl.font
        self.siguienteBtn.layer.cornerRadius = 15
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.seccionView.isHidden = true
        self.opcionesInfo.isHidden = false
        view.addSubview(opcionesInfo)
        opcionesInfo.backgroundColor = .clear
        opcionesInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        opcionesInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        opcionesInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        opcionesInfo.bottomAnchor.constraint(equalTo: siguienteBtn.topAnchor, constant: 0).isActive = true
        
        opcionesInfo.dataSource = self
        opcionesInfo.delegate = self
        
        self.constAncho.constant = self.view.frame.width - 50
        
    }
    
    
    @IBAction func cerrarDetallesBtn(_ sender: Any)
    {
        self.opcionesInfo.isHidden = false
        self.seccionView.isHidden = true
        self.siguienteBtn.isHidden = false
    }
    
    @IBAction func volverBtn(_ sender: Any)
    {
        self.btnLeftAction()
        //self.viewController?.showNavigationViewController(.summary)
    }
    
    @IBAction func otrosTemasBtn(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.infTecnica)
    }

}

extension PrincipalViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "opcionCell", for: indexPath) as! CustomCell
        cell.backgroundColor = .clear
        cell.data = self.dataImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.width/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        self.datosSeccionSV.isHidden = false
        self.contSeccionTV.isHidden = false
        self.infSeccionTV.isHidden = false
        self.imgSeccionImageV.isHidden = false
        //self.siguienteBtn.isHidden = true
        
        switch indexPath.row
        {
            case 0:
                self.contSeccionTV.isHidden = true
                self.infSeccionTV.isHidden = true
                self.imgSeccionImageV.isHidden = true
                
                self.nombLbl.text = Informacion.datPersonalJat [0]
                self.nacLbl.text = Informacion.datPersonalJat [1]
                self.sexLbl.text = Informacion.datPersonalJat [2]
                self.edoCivLbl.text = Informacion.datPersonalJat [3]
                self.dirLbl.text = Informacion.datPersonalJat [4]
                self.telefonoLbl.text = Informacion.telPersonalJat
                self.webLbl.text = Informacion.mailPersonalJat
                
                self.seccionView.isHidden = false
                break
            case 1:
                self.datosSeccionSV.isHidden = true
                
                self.infSeccionTV.text = Informacion.datAcademicosJat
                self.telefonoLbl.text = Informacion.telAcademicosJat
                self.webLbl.text = Informacion.mailAcademicosJat
                self.imgSeccionImageV.image = #imageLiteral(resourceName: "universidad")
                
                self.seccionView.isHidden = false
                break
            case 2:
                self.viewController?.showNavigationViewController(.experL)
                break
            case 3:
                self.datosSeccionSV.isHidden = true
                self.contSeccionTV.isHidden = true
                
                self.infSeccionTV.text = Informacion.datHabilidadesJat
                self.imgSeccionImageV.image = #imageLiteral(resourceName: "cualidades")
                
                self.seccionView.isHidden = false
                break
            default:
                break
        }
        self.tituloSeccionLbl.textColor = self.dataImages[indexPath.row].color
        self.opcionesInfo.isHidden = true
        self.tituloSeccionLbl.text = self.dataImages[indexPath.row].tit
        
    }
}

class CustomCell : UICollectionViewCell
{
    var data : CustumImageData?
    {
        didSet
        {
            guard let data = data else { return}
            let strokeTextAtt =
            [
                NSAttributedString.Key.strokeColor : data.color,
                NSAttributedString.Key.foregroundColor : UIColor.clear,
                NSAttributedString.Key.strokeWidth : -4.0,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)
            ] as [NSAttributedString.Key : Any]
            
            titOpcion.attributedText = NSMutableAttributedString (string: data.tit, attributes: strokeTextAtt)
            imgOpcion.image = data.img
        }
    }
    
    fileprivate let imgOpcion : UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    fileprivate let titOpcion : UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        contentView.addSubview(imgOpcion)
        contentView.addSubview(titOpcion)
        
        imgOpcion.heightAnchor.constraint(equalToConstant: 110).isActive = true
        imgOpcion.widthAnchor.constraint(equalToConstant: 110).isActive = true
        imgOpcion.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -25).isActive = true
        imgOpcion.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        
        titOpcion.topAnchor.constraint(equalTo: imgOpcion.bottomAnchor, constant: 5).isActive = true
        titOpcion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        titOpcion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        titOpcion.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder)
    {   fatalError("init(coder:) has not been implemented") }
}
