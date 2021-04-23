//
//  AllGistsExtension.swift
//  GistApp
//
//  Created by ArjMaster on 23/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

extension AllGistViewController:  UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGists", for: indexPath) as! AllGistsViewCell
        
        cell.setViewCell(allGists[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(allGists[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 90 : 200
    }
}
