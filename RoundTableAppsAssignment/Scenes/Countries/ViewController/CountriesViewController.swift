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
	
	let actionButton 		= ActionButton()
	let tableView			= UITableView()
	
	let hMargin 		= CGFloat(24)
	let vMargin			= CGFloat(24)
	
	init(interactor: CountriesInteractorInterface) {
		
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		configViewController()
        cofingActionButton()
		configTableView()
    }
	
	func configViewController() {
		
		title 					= "Select Countries"
		view.backgroundColor 	= .secondarySystemBackground
	}
	
	func configTableView() {
		
		tableView.backgroundColor = .systemPink
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
		
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -vMargin)
		])
	}
	
	func cofingActionButton() {
		
		actionButton.setTitle("Done", for: .normal)
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
		
		delegate?.viewController(self, didSelect: ["Salam", "Bidar, Ahmad, Java, Salim, midal"])
		dismiss(animated: true, completion: nil)
	}
}

extension CountriesViewController: CountriesPresenterDelegate {
	
}
