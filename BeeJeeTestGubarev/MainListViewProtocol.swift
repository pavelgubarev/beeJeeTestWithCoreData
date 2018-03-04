//
//  MainListViewProtocol.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

public protocol MainListViewProtocol {
    
    func showCurrentMainList(withContacts : [Contact])
    
    func gotoAddContact()
    
    func goToContactView()
}
