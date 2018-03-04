//
//  MainListPresenter.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

final class MainListPresenter : MainListPresenterProtocol {
  
  
    private let view: MainListViewProtocol
    private let model: Model
    
    public init(withView: MainListViewProtocol, withModel: Model) {
        self.view = withView
        self.model = withModel
    }

    
    func showCurrentMainList() {
        view.showCurrentMainList(withContacts : model.contacts)
    }
    
    func showAddContactForm() {
        view.gotoAddContact() 
    }
    
    func showOne(contact : Int) {
        model.currentContact = contact
        view.goToContactView()
    }

    
}
