//
//  ViewController.swift
//  MapViewTest
//
//  Created by Chiwook Ahn on 3/20/25.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(latitude: 37.494531, longitude: 127.027467)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
//        let pin = MKPointAnnotation()
//        pin.coordinate = location
//        pin.title = "IT여성기업인협회 iOS 풀스택 개발과정"
//        pin.subtitle = "비트컴퓨터"
//        mapView.addAnnotation(pin)
        
        let pin = CustomAnnotation(coordinate: location, title: "iOS 풀스택 개발과정", subtitle: "IT여성기업인협회", thumbnail: "kibwa", strURL: "http://www.kibwa.org")
        mapView.addAnnotation(pin)
        mapView.delegate = self
    }

    @IBAction func segmentControl(_ sender: Any)
    {
        guard let segment = sender as? UISegmentedControl else { return }
        
        switch segment.selectedSegmentIndex
        {
            case 1: mapView.preferredConfiguration = MKImageryMapConfiguration()
            case 2: mapView.preferredConfiguration = MKHybridMapConfiguration()
            default : mapView.preferredConfiguration = MKStandardMapConfiguration()
        }
    }
    
}
extension ViewController: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView?
    {
        guard let annotation = annotation as? CustomAnnotation else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
        if annotationView == nil
        {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            let imageView = UIImageView(image: UIImage(named: annotation.thumbnail))
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imageView.contentMode = .scaleAspectFit
            annotationView?.leftCalloutAccessoryView = imageView
            annotationView?.canShowCallout = true
        }
        annotationView?.annotation = annotation
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        guard let annotation = view.annotation as? CustomAnnotation else { return }
//        print(annotation.title)
//        print(annotation.strURL)
        // 스토리보드에서 WebViewController 찾기
        if let webVC = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        {
            webVC.urlString = annotation.strURL  // URL 전달
            navigationController?.pushViewController(webVC, animated: true)
        }
        
    }
    
}

class CustomAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    let thumbnail: String
    let strURL: String
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil, thumbnail: String, strURL: String)
    {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.thumbnail = thumbnail
        self.strURL = strURL
    }
    
}
