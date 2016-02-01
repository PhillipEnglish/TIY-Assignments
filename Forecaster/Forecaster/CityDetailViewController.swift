//
//  CityDetailViewController.swift
//  Forecaster
//
//  Created by Phillip English on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CityDetailViewController: UIViewController
{

    var city = City!()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var apparentTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipProbLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setLabels()
        mapLocation()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Setup View
    
    func setLabels()
    {
        nameLabel.text = city!.name
        iconImage.image = UIImage(named: "\(city.currentWeather!.icon).png")
        currentTempLabel.text = "\(Int(city.currentWeather!.temperature))°F"
        apparentTempLabel.text = "\(Int(city.currentWeather!.apparentTemperature))°F"
        humidityLabel.text = "\(Int((city.currentWeather!.humidity) * 100))%"
        precipProbLabel.text = "\(Int((city.currentWeather!.precipProbability) * 100))%"
        
    }

    
    // MARK: - Map Display
    
    func mapLocation()
    {
        // helper: http://stackoverflow.com/questions/27495328/reverse-geocode-location-in-swift
        
        let latitude: CLLocationDegrees = (city?.lat)!
        let longitude: CLLocationDegrees = (city?.lng)!
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            let mappedLocation = CLLocationCoordinate2DMake(latitude,longitude)
            let viewRegion = MKCoordinateRegionMakeWithDistance(mappedLocation, 10000, 10000)
            self.mapView.setRegion(viewRegion, animated: true)
        })
    }


    
    // MARK: - Navigation

    @IBAction func doneButton(sender: UIBarButtonItem)
    {
        navigationController?.popViewControllerAnimated(true)
    }
    

}
