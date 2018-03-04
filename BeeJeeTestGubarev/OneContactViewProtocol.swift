//
//  ViewOneContactViewProtocol.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

protocol OneContactViewProtocol : class {
    
    func showOne(contact : Contact)
    
    func editButtonPressed()
    
    func gotoEditingCurrentContact()

}
