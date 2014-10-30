//
//  ViewController.swift
//  Date
//
//  Created by Zhanna Fursova on 10/28/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		view.backgroundColor = UIColor.greenColor();

		//0.0 is totally transparent, 1.0 is totally opaque
		view.alpha = 0.4;	//or try 0.75
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

