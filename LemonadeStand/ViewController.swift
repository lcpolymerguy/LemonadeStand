//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Morgan Hart on 12/3/14.
//  Copyright (c) 2014 Morgan Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cash = 10
    var lemons = 1
    var iceCubes = 1
    
    var purchasedLemons = 0
    var purchasedIceCubes = 0
    
    var mixedLemons = 0
    var mixedIceCubes = 0
    
    var acidicRatio: Double = 0.0
    var numberOfCustomers = 0
    
    var individualPreferences: [Double] = []
    
    var lemonadeAcidity = ""
    
    var individualPreferencesAcidity: [String] = []
    
    @IBOutlet weak var totalCashLabel: UILabel!
    @IBOutlet weak var totalLemonsLabel: UILabel!
    @IBOutlet weak var totalIceCubesLabel: UILabel!
    
    @IBOutlet weak var purchasedLemonsLabel: UILabel!
    @IBOutlet weak var purchasedIceCubesLabel: UILabel!
    
    @IBOutlet weak var mixedLemonsLabel: UILabel!
    @IBOutlet weak var mixedIceCubesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonAddButtonPressed(sender: UIButton) {
    
        if cash <= 1 {
        
            println("You do not have enough cash to purchase lemons.")
        
        }
        
        else {
            
            cash -= 2
            lemons += 1
            purchasedLemons += 1
            
            purchasedLemonsLabel.text = "\(purchasedLemons)"
            totalCashLabel.text = "$\(cash)"
            totalLemonsLabel.text = "\(lemons) Lemons"
        
        }
        
    }

    @IBAction func purchaseLemonSubtractButtonPressed(sender: UIButton) {
    
        if lemons == 0 {
            
            println("You have no lemons in your inventory.")
        
        }

        else {
        
            cash += 2
            lemons -= 1
            purchasedLemons -= 1
            
            purchasedLemonsLabel.text = "\(purchasedLemons)"
            totalCashLabel.text = "$\(cash)"
            totalLemonsLabel.text = "\(lemons) Lemons"
        
        }
    
    }
    
    @IBAction func purchaseIceCubesAddButtonPressed(sender: UIButton) {
    
        if cash == 0 {
            
            println("You do not have enough cash to purchase ice cubes.")
            
        }
            
        else {
            
            cash -= 1
            iceCubes += 1
            purchasedIceCubes += 1
            
            purchasedIceCubesLabel.text = "\(purchasedIceCubes)"
            totalCashLabel.text = "$\(cash)"
            totalIceCubesLabel.text = "\(iceCubes) Ice Cubes"
            
        }
        
    }
    
    @IBAction func purchaseIceCubesSubtractButtonPressed(sender: UIButton) {
        
        if iceCubes == 0 {
            
            println("You have no ice cubes left in inventory.")
            
        }

        else {
            
            cash += 1
            iceCubes -= 1
            purchasedIceCubes -= 1
            
            purchasedIceCubesLabel.text = "\(purchasedIceCubes)"
            totalCashLabel.text = "$\(cash)"
            totalIceCubesLabel.text = "\(iceCubes) Ice Cubes"
            
        }
    
    }
    
    @IBAction func mixLemonsAddButtonPressed(sender: UIButton) {
        
        if lemons == 0 {
            
            println("You don't have any more lemons to mix.")
        
        }
        
        else {
            
            mixedLemons += 1
            lemons -= 1
            
            mixedLemonsLabel.text = "\(mixedLemons)"
            totalLemonsLabel.text = "\(lemons) Lemons"
            
        }
    
    }
    
    @IBAction func mixLemonsSubtractButtonPressed(sender: UIButton) {
    
        if mixedLemons == 0 {
            
            println("You don't have any mixing lemons.")
            
        }
        
        else {
            
            mixedLemons -= 1
            lemons += 1
            
            mixedLemonsLabel.text = "\(mixedLemons)"
            totalLemonsLabel.text = "\(lemons) Lemons"
            
        }
        
    }
    
    @IBAction func mixIceCubesAddButtonPressed(sender: UIButton) {
    
        if iceCubes == 0 {
            
            println("You don't have any more ice cubes to mix.")
            
        }
        
        else {
            
            mixedIceCubes += 1
            iceCubes -= 1
            
            mixedIceCubesLabel.text = "\(mixedIceCubes)"
            totalIceCubesLabel.text = "\(iceCubes) Ice Cubes"
            
        }
    
    }
    
    @IBAction func mixIceCubesSubtractButtonPressed(sender: UIButton) {
    
        if mixedIceCubes == 0 {
            
            println("You don't have any mixing ice cubes.")
            
        }
        
        else {
            
            mixedIceCubes -= 1
            iceCubes += 1
            
            mixedIceCubesLabel.text = "\(mixedIceCubes)"
            totalIceCubesLabel.text = "\(iceCubes) Ice Cubes"
        
        }
    
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
    
        if mixedLemons == 0 || mixedIceCubes == 0 {
            
            println("You need lemons and ice cubes mixed in order to start your day.")
            
        }
        
        else {
            
            acidicRatio = Double(mixedLemons) / Double(mixedIceCubes)
        
            //Debug statement
            println(acidicRatio)
            
            generateDailyCustomers()

            // Debug statement
            println(numberOfCustomers)
            
            generateCustomerPreferences()
    
            // Debug statement
            println(individualPreferences)
            
            generateLemonadeAcidity()
            
            //Debug statement
            println(lemonadeAcidity)
            
            generateCustomerPreferencesTaste()
            
            // Debug statement
            println(individualPreferencesAcidity)
            
            compareCustomerPreferences()
            
            resetDay()
            
        }
    }
    
    func generateDailyCustomers() {
        
        numberOfCustomers = Int(arc4random_uniform(UInt32(10))) + 1
        
    }
    
    func generateCustomerPreferences() {
        
        individualPreferences = []
        
        var randomPreferenceInt = 0
        var randomPreferenceFactorDouble: Double = 0.0
        
        for var i = 0; i < numberOfCustomers; i++ {
            
            randomPreferenceInt = Int(arc4random_uniform(UInt32(10)))
            
            randomPreferenceFactorDouble = Double(randomPreferenceInt) / 10.0
            
            individualPreferences.append(randomPreferenceFactorDouble)
            
        }
        
    }
    
    func generateLemonadeAcidity() {
        
        if acidicRatio > 1 {
            
            lemonadeAcidity = "Acidic"
            
        }
        
        else if acidicRatio == 1 {
            
            lemonadeAcidity = "Equal"
            
        }
        
        else {
            
            lemonadeAcidity = "Dilute"
            
        }
        
    }

    func generateCustomerPreferencesTaste() {
        
        individualPreferencesAcidity = []
        
        for var i = 0; i < individualPreferences.count; i++ {
            
            if individualPreferences[i] >= 0 && individualPreferences[i] < 0.4 {
                
                individualPreferencesAcidity.append("Acidic")
                
            }
            
            else if individualPreferences[i] >= 0.4 && individualPreferences[i] <= 0.6 {
                
                individualPreferencesAcidity.append("Equal")
                
            }
            
            else {
                
                individualPreferencesAcidity.append("Dilute")
                
            }
            
        }
        
    }
    
    func compareCustomerPreferences() {
        
        for var i = 0; i < individualPreferences.count; i++ {
            
            if individualPreferencesAcidity[i] == lemonadeAcidity {
                
                println("Paid!")
                
                cash += 1
                
            }
            
            else {
                
                println("No match, No revenue")
                
            }
            
        }
        
        println(cash)
        
        totalCashLabel.text = "$\(cash)"
        
    }

    func resetDay() {
        
        purchasedLemons = 0
        purchasedIceCubes = 0
        
        purchasedLemonsLabel.text = "\(purchasedLemons)"
        purchasedIceCubesLabel.text = "\(purchasedIceCubes)"
        
        mixedLemons = 0
        mixedIceCubes = 0
        
        mixedLemonsLabel.text = "\(mixedLemons)"
        mixedIceCubesLabel.text = "\(mixedIceCubes)"
        
    }
    
}

