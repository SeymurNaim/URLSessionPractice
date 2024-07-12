//
//  PhotosVC.swift
//  URLSessionPractice
//
//  Created by Apple on 01.07.24.
//

import UIKit

class PhotosVC: UIViewController {
    
    private let manager = ApiManager<[PhotosModel]>()
    var datas: [PhotosModel] = []
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureUI()
        fetchPhotos(for: .photos)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func fetchPhotos(for page: TabbarSections) {
        manager.fetchData(for: page) { [weak self] fetchedData, error in
            guard let self = self else { return }
            if let fetchedData = fetchedData {
                self.datas = fetchedData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotosCell.self, forCellReuseIdentifier: "PhotosCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    

   

}

extension PhotosVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell") as! PhotosCell
        cell.configureCell(withImage: "\(datas[indexPath.row].url)")
        cell.nameLabel.text = "\(datas[indexPath.row].title)"
        
        return cell
    }
    
    
}
