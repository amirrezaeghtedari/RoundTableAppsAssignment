//
//  CountriesViewController.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class CountriesViewController: UIViewController, CountriesViewControllerInterface {
	
	weak var delegate: CountriesViewControllerDelgate?
	var interactor: CountriesInteractorInterface
	
	init(interactor: CountriesInteractorInterface) {
		
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

extension CountriesViewController: CountriesPresenterDelegate {
	
}
