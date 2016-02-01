//
//  CityTableViewController.swift
//  Forecaster
//
//  Created by Phillip English on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

let kCitiesKey = "cities"

protocol modalZipCodeViewControllerDelegate
{
    func zipCodeWasChosen(zipCode: Int)
}

protocol CityAPIControllerProtocol
{
    func didReceiveMapsAPIResults(results: NSDictionary)
}

protocol WeatherAPIResultsProtocol
{
    func didReceiveWeatherAPIResults(results: NSDictionary)
}

class CityTableViewController: UITableViewController, modalZipCodeViewControllerDelegate, CityAPIControllerProtocol, WeatherAPIResultsProtocol
{
    var cities = [City]()

    var cityAPI: CityAPIController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "Forecaster"
        
        //Coloring
        navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
       
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    //TableCell Coloring
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cities.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath) as! CityWeatherTableViewCell
        
       let aCity = cities[indexPath.row]
        
        cell.cityLabel?.text = aCity.name
        cell.tempLabel.text = "--°F"
        cell.quickWeatherLabel.text = ""

        if aCity.currentWeather != nil
        {
            cell.tempLabel.text = String(Int(aCity.currentWeather!.temperature)) + "°F"
            cell.quickWeatherLabel.text = String(aCity.currentWeather!.summary)
            cell.iconImage.image = UIImage(named: "\(aCity.currentWeather!.icon).png")

        }
        
        return cell
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(cities[indexPath.row])
      let selectedCity = cities[indexPath.row]
       let cityDetailVC = storyboard?.instantiateViewControllerWithIdentifier("CityDetail") as! CityDetailViewController
      cityDetailVC.city = selectedCity
        navigationController?.pushViewController(cityDetailVC, animated: true)
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            cities.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveCityData()
    }

    
    // MARK: - API Controller Protocols
    
    func didReceiveMapsAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let aCity = City.cityWithJSON(results)
            self.cities.append(aCity)
            
            let weatherAPI = WeatherAPIController(weatherDelegate: self)
            weatherAPI.searchForecastFor(aCity.lat!, lng: aCity.lng!)
            
            self.tableView.reloadData()
        })
    }
    
    func didReceiveWeatherAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let weather = Weather.weatherWithJSON(results)
            
            for aCity in self.cities
            {
                if weather.latitude == aCity.lat
                {
                    aCity.currentWeather = weather as Weather!
//                    let cityCopy = aCity
//                    self.cities.popLast()
//                    self.cities.append(cityCopy)
                }
            }
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }

    
    // MARK: - Loction Delegate
    func zipCodeWasChosen(zipCode: Int)
    {
        print(zipCode)
        
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        self.cityAPI = CityAPIController(cityDelegate: self)
        
        //cityAPI.searchGoogleForCity(zipCode)
        //tableView.reloadData()
        //navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
        let zipCodeArray = [zipCode]
        for zipCode in zipCodeArray
        {
            cityAPI.searchGoogleForCity(zipCode)
            
        }
        
        self.tableView.reloadData()
        print (zipCodeArray)
        print(cities)
    }

 

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "PresentModalZipCodeVCModally"
        {
            let nav = segue.destinationViewController as! UINavigationController
            let modalVC = nav.topViewController as! ModalZipCodeViewController
            modalVC.delegate = self
            modalVC.cities = cities
        }
    }
    

    
    // MARK: -MISC
    
    func loadCityData()
    {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kCitiesKey) as? NSData
        {
            if let savedCities = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [City]
            {
                cities = savedCities
                tableView.reloadData()  
            }
        }
    }
    
    func saveCityData() //this is how we persist data to the disk
    {
        let cityData = NSKeyedArchiver.archivedDataWithRootObject(cities) // you can only archive data like this if every object in the array has nscoding enabled in it. 
        NSUserDefaults.standardUserDefaults().setObject(cityData, forKey: kCitiesKey)
    }

   
}
