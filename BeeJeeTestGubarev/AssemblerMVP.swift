//
//  AssemblerMVP.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

let assembler = AssemblerMVP()

let model = Model()

class AssemblerMVP {
    
    func registerMainTableView(withView view: MainListTableViewController) {
        view.presenter = MainListPresenter(withView: view, withModel: model)
    }
    
    func registerOneContactView(withView view: OneContactTableViewController) {
        view.presenter = OneContactPresenter(withView: view, withModel: model)
        
    }

    func registerEditContactView(withView view: EditTableViewController) {
        view.presenter = EditPresenter(withView: view, withModel: model)
        
    }

}
