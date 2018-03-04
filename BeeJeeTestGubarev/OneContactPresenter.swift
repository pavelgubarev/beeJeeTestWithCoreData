//
//  ViewOneContactPresenter.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

class OneContactPresenter : OneContactPresenterProtocol {
    
    unowned private let view: OneContactViewProtocol
    unowned private let model: Model
    
    public init(withView: OneContactViewProtocol, withModel: Model) {
        self.view = withView
        self.model = withModel
    }

    
    func oneContactViewDidAppear() {
        view.showOne(contact : model.contacts[model.currentContact])
    }
    
    func editCurrentContact() {
        model.editFormMode = .edit
        view.gotoEditingCurrentContact()
    }
    
}
