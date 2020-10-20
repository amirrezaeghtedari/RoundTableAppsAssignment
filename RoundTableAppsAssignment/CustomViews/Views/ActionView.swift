//
//  ActionView.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/29/1399 AP.
//

import UIKit

class ActionView: UIView {

	let label = UILabel()
	
	let hMargin = CGFloat(20)
	let vMargin = CGFloat(3)
	
	override init(frame: CGRect) {
		
		super.init(frame: frame)
		
		configLabel()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func configLabel() {
		
		label.translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		
		NSLayoutConstraint.activate([
		
			label.topAnchor.constraint(equalTo: self.topAnchor, constant: vMargin),
			label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hMargin),
			label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -hMargin),
			label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -vMargin)
		])
	}
	
	var text: String? {
		
		get { label.text }
		set { label.text = newValue }
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews()
		
		layer.cornerRadius = self.frame.height / 2
	}
}
