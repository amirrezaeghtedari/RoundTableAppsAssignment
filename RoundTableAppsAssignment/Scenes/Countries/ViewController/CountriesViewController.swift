//
//  CountriesViewController.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class CountriesViewController: UIViewController, CountriesViewControllerInterface {
	
	enum SectionType {
		case main
	}
	
	var dataSource: UITableViewDiffableDataSource<SectionType, CountryViewModel>!
	
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
		configDataSource()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		
//		tableView.backgroundView = EmptyStateView(frame: tableView.frame)
		
		var snapshot = dataSource.snapshot()
		snapshot.deleteAllItems()
		snapshot.appendSections([SectionType.main])
		
		let x1 = CountryViewModel(name: "Salam va dorood bar all countries around the world", actionLabelTitle: "Add", actionLabelColor: .gray)
		let x2 = CountryViewModel(name: "Doroord", actionLabelTitle: "Added", actionLabelColor: .blue)
		snapshot.appendItems([x1, x2])
		
		dataSource.apply(snapshot)
		
		interactor.fetchCountries()
	}
	
	func configViewController() {
		
		title 					= "Select Countries"
		view.backgroundColor 	= .secondarySystemBackground
	}
	
	func configTableView() {
		
		tableView.backgroundColor = .secondarySystemBackground
		tableView.tableFooterView = UIView()
		tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.reuseIdentifier)
		
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
		
		delegate?.viewController(self, didSelect: ["Salam", "Bidar, Ahmad, Java, Salim, midal, pexilmate"])
		dismiss(animated: true, completion: nil)
	}
	
	func configDataSource() {
		
		dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, countryViewModel) -> UITableViewCell? in
			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.reuseIdentifier) as? CountryTableViewCell else {
				
				return UITableViewCell()
			}
			
			cell.set(viewModel: countryViewModel)
			
			return cell
		})
	}
}

extension CountriesViewController: CountriesPresenterDelegate {
	
}

extension CountriesViewController: UITableViewDelegate {
	

}
