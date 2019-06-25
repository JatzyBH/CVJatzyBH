//
//  EmpresaCollectionViewCell.swift
//  showCV
//
//  Created by Jatziry Barrera on 6/24/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class EmpresaCollectionViewCell: UICollectionViewCell
{
    var timerForShowScrollIndicator: Timer?
    var data : CustomEmpresaData?
    {
        didSet
        {
            guard let data = data else { return}
            let strokeTextAtt =
                [
                    NSAttributedString.Key.strokeColor : UIColor.purple,
                    NSAttributedString.Key.foregroundColor : UIColor.clear,
                    NSAttributedString.Key.strokeWidth : -4.0,
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)
                    ] as [NSAttributedString.Key : Any]
            
            titOpcion.attributedText = NSMutableAttributedString (string: data.nom, attributes: strokeTextAtt)
            imgOpcion.image = data.logo
            dirOpcion.text = data.direc
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            let attributedString = NSMutableAttributedString(string: "Jefe:   \(data.resp) \r\(data.tel) \n\nMi puesto:   \(data.puesto) \r\(data.dura) ", attributes: [NSAttributedString.Key.paragraphStyle:paragraphStyle, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)] )
            
            let paragraphStyle2 = NSMutableParagraphStyle()
            paragraphStyle2.alignment = NSTextAlignment.left
            let secondAttributes = [NSAttributedString.Key.paragraphStyle:paragraphStyle2, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
            let secondString = NSAttributedString(string: "\n\nActividades:\r \(data.actividades)", attributes: secondAttributes)
            attributedString.append(secondString)
            infOpcion.attributedText = attributedString
        }
    }
    
    fileprivate let titOpcion : UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .center
        return lbl
    }()
    
    fileprivate let imgOpcion : UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    fileprivate let dirOpcion : UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    fileprivate let infOpcion : UITextView =
    {
        let txtV = UITextView()
        txtV.translatesAutoresizingMaskIntoConstraints = false
        txtV.textAlignment = .justified
        txtV.backgroundColor = .clear
        txtV.isEditable = false
        txtV.isSelectable = false
        txtV.showsHorizontalScrollIndicator = true
        return txtV
    }()
    
    @objc func showScrollIndicators()
    {
        UIView.animate(withDuration: 0.001) {
            self.infOpcion.flashScrollIndicators()
        }
    }
    func startTimerForShowScrollIndicator()
    {
        self.timerForShowScrollIndicator = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showScrollIndicators), userInfo: nil, repeats: true)
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        contentView.addSubview(titOpcion)
        contentView.addSubview(imgOpcion)
        contentView.addSubview(dirOpcion)
        contentView.addSubview(infOpcion)
        
        titOpcion.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5).isActive = true
        titOpcion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titOpcion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
        titOpcion.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        imgOpcion.topAnchor.constraint(equalTo: titOpcion.bottomAnchor, constant:0).isActive = true
        imgOpcion.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imgOpcion.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imgOpcion.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        
        dirOpcion.topAnchor.constraint(equalTo: imgOpcion.bottomAnchor, constant: 20).isActive = true
        dirOpcion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dirOpcion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        infOpcion.topAnchor.constraint(equalTo: dirOpcion.bottomAnchor, constant: 20).isActive = true
        infOpcion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        infOpcion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        infOpcion.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        
        self.startTimerForShowScrollIndicator()
    }
    
    required init?(coder aDecoder: NSCoder)
    {   fatalError("init(coder:) has not been implemented") }
    
}
