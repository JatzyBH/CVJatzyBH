//
//  NameView.swift
//  Clase encargada de definir las clases ViewController para su intancia.
//  showCV
//
//  Created by Jatziry Barrera on 6/21/19.
//  Copyright © 2019 Jatziry Barrera. All rights reserved.
//

import Foundation

enum NameView: Int
{
    /// Para mostrar la vista de Bienvenida a la app.
    case bienvenida                             = 1
    /// Para mostrar el menú lateral de la app.
    case menuNavigator                          = 2
    /// Para mostrar el resumen profesional.
    case summary                                = 3
    /// Para mostrar la vista del menú principal de la app.
    case menuPrincipal                          = 4
    /// Para mostrar la vista que carga la información técnica.
    case infTecnica                             = 5
    /// Para mostrar la vista ...  de la app.
    case experL                                 = 7
    /// Para mostrar la vista ...   de la app.
    case conocimTec                             = 6
    /// Para mostrar la vista ...  de la app.
    case ingresaDatos                           = 8
    /// Para mostrar la vista ...  de la app.
    case guardoDatos                            = 9
    /// Para mostrar la vista ...  de la app.
    case muestrainf                             = 10
    
    func toString() -> String
    {
        var nombre = String.Empty
        switch self
        {
            case .bienvenida:
                nombre = "bienvenida"
                break
            case .menuNavigator:
                nombre = "menu hamburguesa"
                break
            case .summary:
                nombre = "summary"
                break
            case .menuPrincipal:
                nombre = "menu principal"
                break
            case .conocimTec:
                nombre = "carga información de CV"
                break
            case .infTecnica:
                nombre = "información Tecnica"
                break
            case .experL:
                nombre = "Experiencia Laboral"
                break
            case .ingresaDatos:
                nombre = "Ingresa información"
                break
            case .guardoDatos:
                nombre = "Guardo Datos ingresados"
                break
            case .muestrainf:
                nombre = "Muestra todos los datos"
                break
        }
        return nombre
    }
    
    func getClassName() -> String
    {
        var nombre = String.Empty
        switch self
        {
            case .bienvenida:
                nombre = "MainViewController"
                break
            case .summary:
                nombre = "SummaryViewController"
                break
            case .menuPrincipal:
                nombre = "PrincipalViewController"
                break
            case .infTecnica:
                nombre = "InfTecnicaViewController"
                break
            case .menuNavigator:
                nombre = "MenuNavigatorViewController"
                break
            case .experL:
                nombre = "ExperienciaViewController"
                break
            case .conocimTec:
                nombre = "ConocimientosViewController"
                break
            case .ingresaDatos:
                nombre = "IngresaDatosViewController"
                break
            case .guardoDatos:
                nombre = "GuardoDatosViewController"
                break
            case .muestrainf:
                nombre = "MuestraDatosArchivoViewController"
                break
            default:
                break
        }
        return nombre
    }
    
    func getStoryboard() -> String
    {
        var name = String.Empty
        switch self
        {
            case .bienvenida,.summary, .menuPrincipal, .experL, .infTecnica, .conocimTec:
                name = "Main"
                break
            case .menuNavigator:
                name = "DrawerMenuStoryboard"
                break
            case .ingresaDatos, .guardoDatos, .muestrainf:
                name = "formularioStoryboard"
                break
        }
        return name
    }
}
