//
//  MainListPresenter.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

final class MainListPresenter : MainListPresenterProtocol {
  
  
    unowned private let view: MainListViewProtocol
    unowned private let model: Model
    
    public init(withView: MainListViewProtocol, withModel: Model) {
        self.view = withView
        self.model = withModel
    }

    
    func mainListDidAppear() {
        view.showCurrentMainList(withContacts : model.contacts)
    }
    
    func showAddContactForm() {
        model.editFormMode = .add
        view.gotoAddContact() 
    }
    
    func showOne(contact : Int) {
        model.currentContact = contact
        view.goToContactView()
    }

    
}
