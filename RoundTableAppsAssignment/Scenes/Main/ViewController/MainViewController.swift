//
//  ViewController.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class MainViewController: UIViewController {

	var interactor: SelectedCountriesInteractorInterface
	
	init(interactor: SelectedCountriesInteractorInterface) {
		
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		view.backgroundColor = .green
	}
}

extension MainViewController: MainPresenterDelegate {
	
	func presenter(_: MainPresenter, didSelectCountries countries: [MainCountryViewModel]) {
		
		print(countries)
	}
}

