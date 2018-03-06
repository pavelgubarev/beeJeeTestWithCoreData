//
//  EditPresenter.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

class EditPresenter : EditPresenterProtocol {
    
    unowned private let view: EditTableViewProtocol
    unowned private let model: Model
    
    public init(withView: EditTableViewProtocol, withModel: Model) {
        self.view = withView
        self.model = withModel
    }

    
    func editorDidAppear() {
        var contactToEdit : Contact
        
        if model.editFormMode == .add {
            model.createNewContact()
            contactToEdit = model.newContact!
        } else {
            contactToEdit = model.contacts[model.currentContact]
        }
        
        view.fillFields(withContact : contactToEdit)
    }
    
    func save(_ contact: Contact) {
        if model.editFormMode == .add {
            model.newContact = contact
            model.appendNewContact()
        } else {
            model.contacts[model.currentContact] = contact
        }
        
        model.saveContacts()
        
        view.goBack()
    }
    
    func cancel() {
        if model.editFormMode == .add {
            model.dropNewContact()
        }
        view.goBack()
    }
    
    func delete() {
        model.delete(model.contacts[model.currentContact])
        view.goToMainList()
    }
    
}
