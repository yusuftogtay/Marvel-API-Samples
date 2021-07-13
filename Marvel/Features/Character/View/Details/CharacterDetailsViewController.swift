//
//  CharacterDetailsViewController.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
      
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var comisTable: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    weak var coordinator: MainCordinator?
    
    public var character: Character?
    
    private var comics: [ComicsDetail] = []
    
    lazy var characterDetailsViewController: CharacterDetailsViewController? = {
        return CharacterDetailsViewController.initFromNib()
    }()
    
    lazy var characterDetailViewModel: CharacterDetailViewModel<Character> = {
        return CharacterDetailViewModel<Character>(characterService: CharacterService(), delagate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comisTable.delegate = self
        comisTable.dataSource = self
        fetch()
    }
    
    private func fetch()    {
        DispatchQueue.global(qos: .background).async {
            self.characterDetailViewModel.fetchcharacter(id: "\(self.character!.id!)")
            self.characterDetailViewModel.fetchComics(id: "\(self.character!.id!)")
        }
    }
}

extension CharacterDetailsViewController: UITableViewDataSource, UITableViewDelegate    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = comics[indexPath.row].title
        return cell
    }
    
}

extension CharacterDetailsViewController: CharacterDetailViewControllerProtocol {

    func update(items: Character) {
        self.titleLabel.text = items.name
        self.imageView.af.setImage(withURL: URL(string: imageView.imagePath(thumbnail: items.thumbnail!, size: ImageSizeConstant.STANDARD_MEDIUM))!)
        self.desc.text = items.resultDescription
    }
    
    
    func updateTableView(items: [ComicsDetail]) {
        self.comics = items
        comisTable.reloadData()
    }
    
    func changeLoading(value: Bool) {
        DispatchQueue.main.async {
            if value {
                self.indicator.startAnimating()
                self.indicator.isHidden = false
                self.comisTable.isHidden = true
            } else {
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
                self.comisTable.isHidden = false
            }
        }
    }
}
