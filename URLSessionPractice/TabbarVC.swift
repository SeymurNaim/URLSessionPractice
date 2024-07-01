//
//  TabbarVC.swift
//  URLSessionPractice
//
//  Created by Apple on 01.07.24.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        
        let postsVC = PostsVC()
        postsVC.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(systemName: "house"), tag: 0)
        
        let albumsVC = AlbumsVC()
        albumsVC.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "basket"), tag: 1)
        
        let photosVC = PhotosVC()
        photosVC.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "person"), tag: 2)
        
        let usersVC = UsersVC()
        usersVC.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "bookmark"), tag: 3)
        
        let tabbarList = [postsVC, albumsVC, photosVC, usersVC]
        
        viewControllers = tabbarList.map { UINavigationController(rootViewController: $0) }

    }
    

}
