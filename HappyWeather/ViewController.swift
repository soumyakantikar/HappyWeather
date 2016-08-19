//
//  ViewController.swift
//  HappyWeather
//
//  Created by Soumya Kanti Kar on 8/18/16.
//  Copyright © 2016 Soumya Kanti Kar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let weatherRowIdentifier:String = "weatherRow";
    
    //TODO: Demo Data
    var tableContent:[Int] = [85, 51, 78, 90, 120, 55, 10, 78];
    var tempConvertion:[Int] = [];

    @IBOutlet var weatherInfoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherInfoTable.delegate = self;
        weatherInfoTable.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        print("received memory warning");
    }
    
    //Points to the tableview which will display the weather information
    @IBAction func formatChanger(sender: UISegmentedControl) {
        
        //Keep the actual information
        if tempConvertion.count == 0 {
            tempConvertion = tableContent;
        }
        
        if sender.selectedSegmentIndex == 0 {
            
            for index:Int in 0 ..< tableContent.count {
                tableContent[index] = (tableContent[index]-32)/2;
            }
        }
        else {
            
            tableContent = tempConvertion;
            self.weatherInfoTable.reloadData();
        }
        
        self.weatherInfoTable.reloadData();
    }
    
    
    /*
     * The functions below are related to the table which displays the
     * weather information
     *
     */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(weatherRowIdentifier, forIndexPath: indexPath);
        cell.textLabel?.text = String(tableContent[indexPath.row]);
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        print(tableContent[indexPath.row]);
    }
}

