//
//  ModalZipCodeViewController.swift
//  Forecaster
//
//  Created by Phillip English on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class ModalZipCodeViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate
{
    
    
    @IBOutlet weak var zipCodeTextfield: UITextField!
   // @IBOutlet weak var currentLocationButton: UIButton!
    
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var delegate: modalZipCodeViewControllerDelegate?
    var location: String = ""
    var zipCode: String = ""

    var cities = [City]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //currentLocationButton.enabled = false
        configureLocationManager()
        
        navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
        zipCodeTextfield.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: -UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipCodeTextfield.text != ""
        {
            if validateZipCode(textField.text!)
            {
              zipCode = textField.text!
               textField.resignFirstResponder()
               rc = true
               delegate?.zipCodeWasChosen(Int(zipCode)!)
            }
            else
            {
                textField.text = ""
                textField.becomeFirstResponder()
            }

        }
        return rc
    }
    
    func validateZipCode(zip: String) -> Bool
    {
        let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if zip.characters.count == 5  && zip.rangeOfCharacterFromSet(characterSet)?.count == 1
        {
            return true
        }
        else
        {
            return false
        }
    }

    func configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
            {
                locationManager.requestWhenInUseAuthorization()
            }
            else
            {
                //currentLocationButton.enabled = true
            }
        }
    }

    @IBAction func findCity(sender: UIButton)
    {
        if validateZipCode(zipCodeTextfield.text!)
        {
            search(Int(zipCodeTextfield.text!)!)
        }
    }
   
    func search(zip: Int)
    {
        
        delegate?.zipCodeWasChosen(zip)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
//    func search(zip: String)
//    {
//        delegate?.zipCodeWasChosen(zip)
//    }
    
//    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
//    {
//       currentLocationButton.enabled = true
//    }
//    
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
//    {
//        print(error.localizedDescription)
//    }
//    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) //location array orders locations as they are updated
//    {
//        let location = locations.last
//        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
//            
//            if error != nil
//            {
//                print(error?.localizedDescription)
//            }
//            else
//            {
//                self.locationManager.stopUpdatingLocation()
//                let cityName = placemark?[0].locality
//                let zipCode = placemark?[0].postalCode
//                //self.locationTextField.text = zipCode!
//                let lat = location?.coordinate.latitude
//                let lng = location?.coordinate.longitude
//                //let aCity = City(cityName: cityName!, lat: lat!, long: lng!)
//                //self.delegate?.cityWasFound(aCity)  // here the delegate is in the main tableview controller
//            }
//    }
    
    //MARK: - Action Handlers

//    @IBAction func addCity(sender: UIButton)
//    {
//        search(zipCodeTextfield.text!)
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    @IBAction func useLocationTapped(sender: UIButton)
//    {
//        locationManager.startUpdatingLocation()  //asks gps chip where the user is and updates the location
//    }
    
    // MARK: - CLLocation related methods
    
//    func configureLocationManager()
//    {
//        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
//        {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
//            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
//            {
//                locationManager.requestWhenInUseAuthorization()
//            }
//            else
//            {
//                //currentLocationButton.enabled = true
//            }
//        }
//    }
}
