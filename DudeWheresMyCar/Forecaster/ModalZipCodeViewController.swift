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
    
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var delegate: modalZipCodeViewControllerDelegate?
    var location: String = ""
    var zipCode: String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
        // Do any additional setup after loading the view.
        zipCodeTextfield.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipCodeTextfield.text != ""
        {
            zipCode = textField.text!
            textField.resignFirstResponder()
            rc = true
            delegate?.zipCodeWasChosen(zipCodeTextfield.text!)
        }
        print(textField.text) ; print(zipCode)
        
        return rc
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func search(zip: String)
    {
        delegate?.zipCodeWasChosen(zip)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
       // currentLocationButton.enabled = true
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) //location array orders locations as they are updated
    {
        let location = locations.last
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                let cityName = placemark?[0].locality
                let zipCode = placemark?[0].postalCode
                //self.locationTextField.text = zipCode!
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                //let aCity = City(cityName: cityName!, lat: lat!, long: lng!)
                //self.delegate?.cityWasFound(aCity)  // here the delegate is in the main tableview controller
            }
    }
    
    //MARK: - Action Handlers

    @IBAction func addCity(sender: UIButton)
    {
        search(zipCodeTextfield.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func useLocationTapped(sender: UIButton)
    {
        locationManager.startUpdatingLocation()  //asks gps chip where the user is and updates the location
    }
    
    // MARK: - CLLocation related methods
    
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
}
