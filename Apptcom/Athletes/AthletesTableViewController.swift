//
//  AthletesTableViewController.swift
//  Apptcom
//
//  Created by BinaryBoy on 10/18/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class AthletesTableViewController: UITableViewController {

    private let athletesPresenter = AthletesPresenter(athletesService: AthletesService())
    private let cellIdentifier = "Cell"
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        setupTableView()
        setupTableViewBinding()
        setupTableSelected()
    }
    private func setupTableView() {
        
        //This is necessary since the UITableViewController automatically set his tableview delegate and dataSource to self
        tableView.delegate = nil
        tableView.dataSource = nil
        
        tableView.tableFooterView = UIView() //Prevent empty rows
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupTableViewBinding() {
        
        athletesPresenter.dataSource?
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: UITableViewCell.self)) {  row, athlete, cell in
                print(athlete)
                
                cell.textLabel?.text = athlete.name

                let url = URL(string: athlete.image!)
                let image = UIImage(named: "default_profile_icon")
                cell.imageView?.kf.setImage(with: url, placeholder: image)
                 cell.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                cell.layoutIfNeeded() //update immediately
                cell.imageView?.kf.indicatorType = .activity

            }
            .addDisposableTo(disposeBag)
        
        
    }

    private func setupTableSelected(){
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let athlete:Athlete = self!.athletesPresenter.athletes![indexPath.row]
                self?.performSegue(withIdentifier: "show_item", sender: athlete)
            }).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let athleteDetailsViewController:AthleteDetailsViewController = segue.destination as! AthleteDetailsViewController
        athleteDetailsViewController.athlete =  sender as! Athlete
    }
 

}
