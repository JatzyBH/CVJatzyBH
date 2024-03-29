//
//  MainViewController.swift
//  Clase principal para la pantalla de presentación.
//  showCV
//
//  Created by Jatziry Barrera on 6/21/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController
{
    @IBOutlet weak var btnEmpezar: UIButton!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.setHideNavigationBar(hidden: true)
        self.btnEmpezar.layer.cornerRadius = 15
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func verCV(_ sender: Any)
    {
        self.viewController?.showNavigationViewController(.summary)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
