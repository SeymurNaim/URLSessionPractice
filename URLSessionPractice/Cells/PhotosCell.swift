//
//  PhotosCell.swift
//  URLSessionPractice
//
//  Created by Apple on 12.07.24.
//

import UIKit

class PhotosCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        configure()
    }
    
    
    private func configure() {
        addSubview(nameLabel)
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            image.heightAnchor.constraint(equalToConstant: 120),
            image.widthAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    func configureCell(withImage image: String) {
        showImage(image: image, imageView: self.image)
    }

}
