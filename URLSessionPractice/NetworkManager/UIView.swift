//
//  UIView.swift
//  URLSessionPractice
//
//  Created by Apple on 12.07.24.
//

import UIKit
import Kingfisher


func showImage(image: String, imageView: UIImageView) {
    if let url = URL(string: image) {
        imageView.kf.setImage(with: url)
    } else {
        print("Invalid URL string")
    }
}
