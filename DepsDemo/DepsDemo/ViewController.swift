//
//  ViewController.swift
//  DepsDemo
//
//  Created by Zachary Orr on 1/8/24.
//

import UIKit
import TBAStore
import TBAData

class ViewController: UIViewController {

    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<String, Event>!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, event in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            cell.textLabel?.text = event.key

            return cell
        })

        let store: TBAStore = try! TBAStore(apiKey: "")

        Task {
            do {
                let events = try await store.events(year: 2024)
                print(events)

                var snapshot = NSDiffableDataSourceSnapshot<String, Event>()
                snapshot.appendSections(["2024"])
                snapshot.appendItems(events)
                await dataSource?.apply(snapshot, animatingDifferences: false)
            }
            catch {
                print("Error fetching events - \(error)")
            }
        }
    }


}

