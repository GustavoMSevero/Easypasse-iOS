//
//  SideMenuVC.swift
//  Side Menu
//
//  Created by Gustavo Severo on 27/04/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("ShowTelaInicial"), object: nil)
        case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowLocalizarOnibus"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("ShowIndicar"), object: nil)
        case 3: NotificationCenter.default.post(name: NSNotification.Name("ShowCreditos"), object: nil)
        case 4: NotificationCenter.default.post(name: NSNotification.Name("ShowHistorico"), object: nil)
        case 5: NotificationCenter.default.post(name: NSNotification.Name("ShowConfiguracoes"), object: nil)
        default: break
        }
    }

}
