//
//  InfTecnicaViewController.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/22/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit


struct CustomHerramData
{
    var nom : String
    var logo : UIImage
}

class InfTecnicaViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate
{
    let dataHerram =
        [
            CustomHerramData(nom: "GitHub", logo: #imageLiteral(resourceName: "Herr1")),
            CustomHerramData(nom: "GitKraken", logo: #imageLiteral(resourceName: "Herr2")),
            CustomHerramData(nom: "Jira", logo: #imageLiteral(resourceName: "Herr3")),
            CustomHerramData(nom: "Xcode", logo: #imageLiteral(resourceName: "Herr4")),
            CustomHerramData(nom: "Postman", logo: #imageLiteral(resourceName: "Herr8")),
            CustomHerramData(nom: "SourceTree", logo: #imageLiteral(resourceName: "Herr9")),
            CustomHerramData(nom: "CocoaPods", logo: #imageLiteral(resourceName: "Herr5")),
            CustomHerramData(nom: "Bitbucket", logo: #imageLiteral(resourceName: "Herr6")),
            CustomHerramData(nom: "Metodología ágil Scrum", logo: #imageLiteral(resourceName: "Herr7"))
        ]
    fileprivate let herramientas: UICollectionView =
    {
        let layout = UICollectionViewFlowLayout()
        let baseCollectionV = UICollectionView (frame: .zero, collectionViewLayout: layout)
        baseCollectionV.decelerationRate = UIScrollView.DecelerationRate.fast
        baseCollectionV.translatesAutoresizingMaskIntoConstraints = false
        baseCollectionV.register(CustomHerramCell.self, forCellWithReuseIdentifier: "herramCell")
        return baseCollectionV
    }()
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var siguienteBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setHideNavigationBar(hidden: true)
        self.tituloLbl.font = self.isIphone() == "SE" ? UIFont.boldSystemFont(ofSize: 28.0) : UIFont.boldSystemFont(ofSize: 34.0)
        
        view.addSubview(herramientas)
        herramientas.backgroundColor = .clear
        herramientas.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        herramientas.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        herramientas.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        herramientas.bottomAnchor.constraint(equalTo: siguienteBtn.topAnchor, constant: 0).isActive = true
        
        herramientas.dataSource = self
        herramientas.delegate = self
        
        self.siguienteBtn.layer.cornerRadius = 15
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.dataHerram.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "herramCell", for: indexPath) as! CustomHerramCell
        cell.backgroundColor = .clear
        cell.data = self.dataHerram[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.width/2.5)
    }
    
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFont
    {
        return 1.0 as! CGFont
    }
    
    @IBAction func cerrarBtn(_ sender: Any)
    {
        self.btnLeftAction()
        //self.viewController?.showNavigationViewController(.menuPrincipal)
    }
    
    @IBAction func conocimientosBtn(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.conocimTec)
    }
    
}


class CustomHerramCell : UICollectionViewCell
{
    var data : CustomHerramData?
    {
        didSet
        {
            guard let data = data else { return}
            logoHerram.image = data.logo
        }
    }
    
    fileprivate let logoHerram : UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        contentView.addSubview(logoHerram)
        
        logoHerram.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logoHerram.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoHerram.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        logoHerram.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder)
    {   fatalError("init(coder:) has not been implemented") }
}
