//
//  EmptyStateView.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/29/1399 AP.
//

import UIKit

class EmptyStateView: UIView {

	var label 		= TitleLabel(textAlignment: .center)
	var imageView 	= UIImageView(frame: .zero)
	
	override init(frame: CGRect) {
		
		super.init(frame: frame)
		
		configLabel()
		configImageView()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configLabel() {
		
		label.numberOfLines	= 0
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		
		NSLayoutConstraint.activate([
		
			label.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
			label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
			label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
		])
	}
	
	private func configImageView() {
		
		imageView.image = Images.emptyStateLogo
		imageView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(imageView)
		
		NSLayoutConstraint.activate([
			
			imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
			imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
			imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1)
		])
	}

}
