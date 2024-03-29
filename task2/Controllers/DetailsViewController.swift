//
//  DetailsViewController.swift
//  task2
//
//  Created by Anton on 5/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.text = cafeDetails?.name
           // print("name: \(districtDetails?.name)")
        }
    }
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var cafeImage: UIImageView!
    
    var isbel: Bool = false
    var isusa: Bool = false
    var isgeorgia: Bool = false
    
    @IBOutlet weak var back: UIButton!
    var cafeDetails: CurCafeInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherGetter.getTemperature(latitude: (cafeDetails?.latitude)!, longitude: (cafeDetails?.longitude)!, completition: viewWeather, completition2: viewWeatherCondition)
        
        descLabel.text = cafeDetails?.desc
        cafeImage.image = UIImage.init(named: (cafeDetails?.name)!)
    }
    
    func viewWeather(temperature:Double) {
        self.weatherLabel.text = "Temperature: \(temperature)"
    }
    
    func viewWeatherCondition(condition:String) {
        self.weatherLabel.text = self.weatherLabel.text! + ("\n \(condition)")
    }
    
    @IBAction func returnBack(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
            if let mvc = segue.destination as? ViewController {
                mvc.isbel = self.isbel
                mvc.isusa = self.isusa
                mvc.isgeorgia = self.isgeorgia
            }
        }
    }
}
