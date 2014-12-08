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
            
            println("You have not purchased any lemons.")
        
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
            
            println("You have not purchased any ice cubes.")
            
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
    }
    
}

