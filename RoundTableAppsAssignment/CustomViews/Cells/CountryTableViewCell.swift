//
//  CountryTableViewCell.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/28/1399 AP.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

	static var reuseIdentifier: String {
		
		String(describing: self)
	}
	
	let countryLabel 	= UILabel()
	let actionView		= ActionView()
	
	let hMargin 	= CGFloat(24)
	let vMargin		= CGFloat(24)
	
    override func awakeFromNib() {
        
		super.awakeFromNib()
        
		configCountryLabel()
		configActionLabel()
    }

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configCountryLabel()
		configActionLabel()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func configCountryLabel() {
		
		countryLabel.font		= .preferredFont(forTextStyle: .title3)
		countryLabel.textColor	= .label
		
		countryLabel.setContentHuggingPriority(UILayoutPriority(20), for: .horizontal)
		countryLabel.setContentCompressionResistancePriority(UILayoutPriority(20), for: .horizontal)
		countryLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(countryLabel)
		
		NSLayoutConstraint.activate([
		
			countryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: vMargin),
			countryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hMargin),
			countryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -vMargin)
		])
	}
	
	func configActionLabel() {
		
		actionView.label.font			= .preferredFont(forTextStyle: .headline)
		actionView.label.textColor		= .white
		actionView.label.textAlignment	= .center
		
		actionView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(actionView)
		
		NSLayoutConstraint.activate([
		
			actionView.leadingAnchor.constraint(equalTo: countryLabel.trailingAnchor, constant: hMargin),
			actionView.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor),
			actionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -hMargin)
		])
	}
	
	func set(viewModel: CountryViewModel) {
		
		self.countryLabel.text 		= viewModel.name
		self.actionView.text 		= viewModel.actionLabelTitle
		
		switch viewModel.actionLabelColor {
		
		case .blue:
			
			self.actionView.backgroundColor = .systemBlue
		
		case .gray:
			
			self.actionView.backgroundColor = .systemGray
		}
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        
		super.setSelected(selected, animated: animated)
    }

}

