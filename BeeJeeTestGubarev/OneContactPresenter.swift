//
//  ViewOneContactPresenter.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

class OneContactPresenter : OneContactPresenterProtocol {
    
    private let view: OneContactViewProtocol
    private let model: Model
    
    public init(withView: OneContactViewProtocol, withModel: Model) {
        self.view = withView
        self.model = withModel
    }

    
    func showOneContact() {
        view.showOne(contact : model.contacts[model.currentContact])
    }
    
}
