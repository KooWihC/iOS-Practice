//
//  ViewController.swift
//  CoreLocationTest
//
//  Created by Chiwook Ahn on 3/20/25.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }

    @IBAction func locationBtn(_ sender: Any)
    {
        manager.startUpdatingLocation()
    }
    
}

extension ViewController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        manager.stopUpdatingLocation()
        guard let location = locations.last else { return }
        locationLabel.text = "위도 : \(location.coordinate.latitude)\n 경도 : \(location.coordinate.longitude)"
    }
}
