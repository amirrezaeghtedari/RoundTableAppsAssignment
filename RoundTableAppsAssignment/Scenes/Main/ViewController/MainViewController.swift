//
//  ViewController.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class MainViewController: UIViewController {

	var interactor: SelectedCountriesInteractorInterface
	var countriesViewController: CountriesViewControllerInterface?
	
	let titleLabel 		= UILabel()
	let messageLabel 	= UILabel()
	
	init(interactor: SelectedCountriesInteractorInterface) {
		
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
		
		//		self.countriesViewController = CountriesComposer().makeModule()
		//		self.countriesViewController.delegate = self
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		configViewController()
		configTitleLabel()
		configMessgeLabel()
	}
	
	func configViewController() {
		
		view.backgroundColor = .systemBackground
	}
	
	func configTitleLabel() {
		
		titleLabel.font 		= UIFont.preferredFont(forTextStyle: .title3)
		titleLabel.textColor	= UIColor.label
		titleLabel.text			= "Countries"
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
		
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	func configMessgeLabel() {
		
		messageLabel.font		= UIFont.preferredFont(forTextStyle: .body)
		messageLabel.textColor	= UIColor.secondaryLabel
		messageLabel.text		= "Your selected countries are here"
		
		messageLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(messageLabel)
		
		NSLayoutConstraint.activate([
		
			messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}

extension MainViewController: MainPresenterDelegate {
	
	func presenter(_: MainPresenter, didSelectCountries countries: [MainCountryViewModel]) {
		
		print(countries)
	}
}

extension MainViewController: CountriesViewControllerDelgate {
	
	func viewController(_: CountriesViewController, didSelect: [Country]) {
		//Todo
	}

}

