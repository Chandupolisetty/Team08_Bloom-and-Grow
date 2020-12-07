//
//  ViewController.swift
//  GreenHouse
//
//  Created by S531823 on 2/21/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var plants:[String] = ["Spikey the Cactus", "Lily the Snake Plant", "Yoshi the Yucca"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel!.text = plants[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "GreenHouse"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settings(sender:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addPlant(sender:)))
    }
    
    @objc
    func settings(sender: Any) {
        
    }

    @objc
    func addPlant(sender: Any) {
        
    }

}

