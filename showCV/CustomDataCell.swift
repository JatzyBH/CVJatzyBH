//
//  CustomDataCell.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/26/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class CustomDataCell: UITableViewCell
{
    var data : DatosIngresados?
    {
        didSet
        {
            guard let data = data else { return}
            let strokeTextAtt =
                [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize:24)
                    ] as [NSAttributedString.Key : Any]
            
            nombreCompleto.attributedText = NSMutableAttributedString (string: data.nombreS! + " " + data.apellPat! + " " + data.apellMat!, attributes: strokeTextAtt)
            
            contactoEmail.text = data.email!
            contactoTel.text = data.telef! //String(datosIngresados[indexPath.row].telef)
        }
    }
    
    fileprivate let card : UIView =
    {
        let viewC = UIView()
        viewC.translatesAutoresizingMaskIntoConstraints = false
        return viewC
    }()
    
    fileprivate let nombreCompleto : UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    fileprivate let contactoTel : UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
    }()
    
    fileprivate let contactoEmail : UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFont.systemFont(ofSize: 20)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        card.addshadow()
        card.addSubview(nombreCompleto)
        card.addSubview(contactoTel)
        card.addSubview(contactoEmail)
        contentView.addSubview(card)
        
        
        card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        nombreCompleto.topAnchor.constraint(equalTo: card.topAnchor, constant: 5).isActive = true
        nombreCompleto.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10).isActive = true
        nombreCompleto.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: 0).isActive = true
        nombreCompleto.bottomAnchor.constraint(equalTo: contactoTel.topAnchor, constant: -10).isActive = true
        
        contactoTel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10).isActive = true
        contactoTel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: 0).isActive = true
        contactoTel.bottomAnchor.constraint(equalTo: contactoEmail.topAnchor, constant: -10).isActive = true
        
        contactoEmail.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 10).isActive = true
        contactoEmail.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: 0).isActive = true
        contactoEmail.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder)
    {   fatalError("init(coder:) has not been implemented") }
    
    
}
extension UIView
{
    func addshadow()
    {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        backgroundColor = .white
        layer.cornerRadius = 12
    }

}
