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
	
	let actionButton	= ActionButton()
	let titleLabel 		= UILabel()
	let messageLabel 	= UILabel()
	let countriesView	= CountriesView()
	
	let hMargin 		= CGFloat(24)
	let vMargin			= CGFloat(24)
	
	var countriesNavigationController: UINavigationController?
	
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
		
		configActionButton()
		
		configTitleLabel()
		configMessgeLabel()
		configCountriesView()
	}
	
	func configViewController() {
		
		view.backgroundColor = .secondarySystemBackground
	}
	
	func configActionButton() {
		
		actionButton.setTitle("Choose", for: .normal)
		actionButton.addTarget(self, action: #selector(actionButtonDidTap(button:)), for: .touchUpInside)
		
		actionButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(actionButton)
		
		NSLayoutConstraint.activate([
		
			actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -vMargin),
			actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vMargin),
			actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -vMargin),
			actionButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
	@objc
	func actionButtonDidTap(button: UIButton) {
		
		if let countriesNavigationController = self.countriesNavigationController {
			
			self.present(countriesNavigationController, animated: true, completion: nil)
		
		} else {
			
			countriesNavigationController = CountriesNavigationControllerComposer().makeModule(delegate: self)
			self.present(countriesNavigationController!, animated: true, completion: nil)
		}
	}
	
	func configTitleLabel() {
		
		titleLabel.font 		= UIFont.preferredFont(forTextStyle: .title3)
		titleLabel.textColor	= UIColor.label
		titleLabel.text			= Strings.countries
		
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
		messageLabel.text		= Strings.selectedCountriesMessage
		
		messageLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(messageLabel)
		
		NSLayoutConstraint.activate([
		
			messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
			messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	func configCountriesView() {
		
		countriesView.translatesAutoresizingMaskIntoConstraints = false
		countriesView.setContentHuggingPriority(UILayoutPriority(200), for: .vertical)
		
		view.addSubview(countriesView)
		
		NSLayoutConstraint.activate([
		
			countriesView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 50),
			countriesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hMargin),
			countriesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hMargin),
			countriesView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -vMargin)
		])
	}
}

extension MainViewController: MainPresenterDelegate {
	
	func presenter(_: MainPresenter, didSelectCountries countries: [MainCountryViewModel]) {
		
		print(countries)
	}
}

extension MainViewController: CountriesViewControllerDelgate {
	
	func viewController(_: CountriesViewController, didSelect countries: [Country]) {
		
		let countryNames = countries.map() { country in
			
			return country.name
		}
		
		countriesView.text = countryNames.joined(separator: ", ")
	
	}
	
}

