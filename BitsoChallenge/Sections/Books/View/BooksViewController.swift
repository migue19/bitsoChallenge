//
//  BooksViewController.swift
//  BitsoChallenge
//
//  Created by MacbookPro on 5/22/19.
//  Copyright © 2019 nut. All rights reserved.
//

import UIKit

class BooksViewController: BaseViewController {
    var eventHandler: BooksViewEventHandler?
    var collectionView: UICollectionView?
    var progress: ProgressViewCustom?
    var dataSource: [PayloadResponse]? = []
    var refreshControl: UIRefreshControl?

   
    override func createView() {
        self.view.backgroundColor = UIColor.BITSO_BROWN_COLOR
        progress = ProgressViewCustom(context: self)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (view.frame.width/3)-1, height: (view.frame.width/3)-1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        //layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(UpdateCollectionView), for: .valueChanged)
        
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView?.register(BooksCollectionCell.self, forCellWithReuseIdentifier: "BooksCollectionCell")
        collectionView?.backgroundColor = .clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.addSubview(refreshControl!)
    }
    
    override func addViews() {
        self.view.addSubview(collectionView!)
    }
    
    override func setupLayout() {
        view.addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: collectionView!)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bitso Last Price"
        //self.navigationController?.navigationBar.tintColor = UIColor.BITSO_BROWN_COLOR
        eventHandler?.getBooks()
        
    }
    
    @objc func UpdateCollectionView(){
        self.eventHandler?.getBooks()
    }

    

}

extension BooksViewController: BooksView{
    func fillCollection(books: [PayloadResponse]?) {
        refreshControl?.endRefreshing()
        dataSource = books
        self.getLastPrice()
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
            
        }
    }
    
    
    func printLastPrice(book: TickerModel){
        DispatchQueue.main.async {
            for (index, data) in self.dataSource!.enumerated() {
                if(data.book == book.book){
                    self.dataSource?[index].ticker = book
                    self.collectionView?.reloadData()
                    break
                }
            }
        }
    }
    
    
    func getLastPrice(){
        if(dataSource == nil){
            return
        }else{
            for book in dataSource!{
                print(book)
                eventHandler?.lastPrice(book: book.book!)
            }
        }
    }
}


extension BooksViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionCell", for: indexPath) as! BooksCollectionCell
        cell.imageTip.image = UIImage(named: "bitso")
        cell.backgroundColor = UIColor.BITSO_GREEN_COLOR
        cell.labelDescription.text = dataSource?[indexPath.row].book
        if(dataSource?[indexPath.row].ticker != nil){
            cell.labelLastPrice.text = dataSource?[indexPath.row].ticker?.last
        }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoController = BooksDetailView()
        infoController.ticker = dataSource?[indexPath.row].ticker
        infoController.modalPresentationStyle = .overCurrentContext
        //infoController.delegate = self
        self.present(infoController, animated: true, completion: nil)
    }
    
    
}
