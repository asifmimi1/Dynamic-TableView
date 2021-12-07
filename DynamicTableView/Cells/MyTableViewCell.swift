//
//  MyTableViewCell.swift
//  DynamicTableView
//
//  Created by Asif Rabbi on 5/12/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    var stackView  = UIStackView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(items: [String]) {
        stackView.removeFromSuperview()
        
        //Image View
        func imageName(name : String) -> UIImageView{
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.blue
//            imageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
//            imageView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
            imageView.image = UIImage(named: name)
            return imageView
        }
        
        //Text Label
        func textName(name : String, textHeight: Int) -> UITextView{
            let textLabel = UITextView()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.backgroundColor = UIColor.yellow
            textLabel.font = UIFont.systemFont(ofSize: CGFloat(textHeight))
            textLabel.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
//            textLabel.heightAnchor.constraint(equalToConstant: CGFloat(textHeight)).isActive = true
            textLabel.text  = name
            textLabel.textAlignment = .center
            textLabel.sizeToFit()
            textLabel.isScrollEnabled = false
            return textLabel
        }
        
        //Stack View
        stackView   = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 15.0

        for i in items{
            if i == "image1" || i == "image2" || i == "image3" || i == "image4"{
                stackView.addArrangedSubview(imageName(name: i))
            }else{
                stackView.addArrangedSubview(textName(name: i, textHeight: 30))
            }
        }
        self.addSubview(stackView)
        
        //Constraints
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

