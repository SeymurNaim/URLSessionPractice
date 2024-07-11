//
//  PostsVC.swift
//  URLSessionPractice
//
//  Created by Apple on 01.07.24.
//

import UIKit

class PostsVC: UIViewController {
    
    private let manager = ApiManager<[PostModel]>()
    var datas: [PostModel] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        configureUI()
        fetchData(for: .post)
    }
    
    private func fetchData(for category: TabbarSections) {
        manager.fetchData(for: category) { [weak self] fetchedData, error in
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
        tableView.register(PostsCell.self, forCellReuseIdentifier: "PostsCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension PostsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell") as! PostsCell
        cell.titleLabel.text = "\(datas[indexPath.row].title)"
        cell.bodyLabel.text = "\(datas[indexPath.row].body)"
        
        return cell
    }
}

