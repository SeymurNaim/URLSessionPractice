//
//  AlbumsVC.swift
//  URLSessionPractice
//
//  Created by Apple on 01.07.24.
//

import UIKit

class AlbumsVC: UIViewController {

    private let manager = ApiManager<[AlbumsModel]>()
    var datas: [AlbumsModel] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureUI()
        fetchData(for: .albums)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func fetchData(for page: TabbarSections) {
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
        tableView.register(AlbumsCell.self, forCellReuseIdentifier: "AlbumsCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension AlbumsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumsCell") as! AlbumsCell
        cell.titleLabel.text = "\(datas[indexPath.row].title)"
        
        return cell
    }
}
