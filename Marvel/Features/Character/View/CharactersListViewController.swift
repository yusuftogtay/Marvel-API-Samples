//
//  CharactersListViewController.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import UIKit

class CharactersListViewController: UIViewController, Storyboarded  {
    
    var window: UIWindow?
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    private var characters: [Character] = []
    
    weak var coordinator: MainCordinator?

    
    lazy var charactersListViewController: CharactersListViewController? = {
        return CharactersListViewController.initFromNib()
    }()
    
    lazy var charatersTableViewProvider: CharactersTableViewProvider = {
        return CharactersTableViewProvider(items: characters)
    }()
    
    lazy var charactersViewModel: CharactersViewModel<Character> = {
        return CharactersViewModel<Character>(characterService: CharacterService(), delagate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersTableView.rowHeight = 160
        charactersTableView.delegate = charatersTableViewProvider
        charactersTableView.dataSource = charatersTableViewProvider
        charatersTableViewProvider.delegate = charactersViewModel
        fetchItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        charactersTableView.frame = view.bounds
        
    }
    
    private func fetchItems() {
        DispatchQueue.global(qos: .background).async {
            self.charactersViewModel.fetchcharactersItems(count: 0)
        }
    }
    
}

extension CharactersListViewController: CharacterListViewControllerProtocol {
    func changeLoading(value: Bool) {
        DispatchQueue.main.async {
            if value {
                self.indicator.startAnimating()
                self.indicator.isHidden = false
                self.charactersTableView.isHidden = true
            } else {
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
                self.charactersTableView.isHidden = false
            }
        }
    }
    
    func updateTableView(items: [Character]) {
        charatersTableViewProvider.updateItems(items: items)
        charactersTableView.reloadData()
    }
    
    func navigateToDetail(item: Character, selectedIndex: Int) {
        let vc: CharacterDetailsViewController = CharacterDetailsViewController(nibName: "CharacterDetailsViewController", bundle: nil)
        vc.character = item
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func navigateToFavorite() {
        
    }
    
    func showError(description: String) {
        print(description)
    }
    
}
