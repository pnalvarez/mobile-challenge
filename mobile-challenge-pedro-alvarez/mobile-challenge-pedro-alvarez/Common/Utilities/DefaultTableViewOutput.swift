//
//  DefaultTableViewOutput.swift
//  mobile-challenge-pedro-alvarez
//
//  Created by Pedro Alvarez on 24/06/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol DefaultTableViewOutputDelegate: class {
    func cellWillDisplay(at indexPath: IndexPath)
}

class DefaultTableViewOutput: TableViewOutput {
    
    weak var delegate: DefaultTableViewOutputDelegate?
    var sections: [TableViewSectionProtocol]
    
    init(sections: [TableViewSectionProtocol]) {
        self.sections = sections
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].heightForHeader()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].headerView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].cellHeightFor(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].cellAt(indexPath: indexPath, tableView: tableView)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.cellWillDisplay(at: indexPath)
    }
}
