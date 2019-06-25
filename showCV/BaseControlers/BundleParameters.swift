//
//  BundleParameters.swift
//  Clase encargada de asignar y pasar parametros entre los view controllers.
//  showCV
//
//  Created by Jatziry Barrera on 6/21/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import UIKit

class BundleParameters
{
    /// Var como objeto para pasar parametros entre ViewControllers.
    fileprivate var params: [String : Any] = [:]
    
    /**
    Agrega un valor para pasar entre ViewControllers.
     - parameters:
        - value: El valor que se desea agregar a la lista de parametros.
        - key: La llave que identifica al valor guardado.
     **/
    func add(_ value: Any, key: String)
    {   params.updateValue(value, forKey: key)  }
    
    /**
     Retorna el valor en tipo Int.
      - parameters:
        - key: Llave del valor que se desea obtener.
     **/
    func getInt(_ key: String) -> Int
    {   return params[key] as? Int ?? -1    }
    
    /**
     Retorna el valor en tipo String.
      - parameters:
        - key: Llave del valor que se desea obtener.
     **/
    func getString(_ key: String) -> String {
        return params[key] as? String ?? String.Empty
    }
    
    /**
     Retorna el valor en tipo Bool.
      - parameters:
        - key: Llave del valor que se desea obtener.
     - returns:
     **/
    func getBool(_ key: String) -> Bool
    {   return params[key] as? Bool ?? false    }
    
    
    /**
     Retorna el objeto persistido (de tipo generico).
      - parameters:
        - key: Llave del valor que se desea obtener.
     **/
    func get<Element>(_ key: String) -> Element?
    {
        if let retorna = params[key] as? Element
        {   return retorna  }
        return nil
    }

}


