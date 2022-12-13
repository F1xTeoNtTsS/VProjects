//
//  ListCollectionViewController.swift
//  PokemonInfo
//
//  Created by F1xTeoNtTsS on 19.01.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController{

    
    var pokemons = [CurrentPokemonModel]()

    let activityIndicator: UIActivityIndicatorView = {
        let activityIV = UIActivityIndicatorView(style: .large)
        activityIV.startAnimating()
        activityIV.hidesWhenStopped = true
        activityIV.color = .darkGray
        activityIV.translatesAutoresizingMaskIntoConstraints = false
        return activityIV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView!.register(PokemonInfoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setConstraints()
        fetchPokemons()
    }
    
    func setConstraints() {
        self.collectionView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func fetchPokemons() {
        var pokemonsArray = [CurrentPokemonModel]()
        let group = DispatchGroup()
        NetworkManager.shared.fetchPokemons { pokemons, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let pokemons = pokemons {
                let results = pokemons.results
                for currentPockemon in results {
                    group.enter()
                    NetworkManager.shared.fetchPokemonWith(url: currentPockemon.url) { pokemon, error in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }
                        if let pokemon = pokemon {
                            let imageString = pokemon.sprites.other.artwork.pokemonImage
                            NetworkManager.shared.transformImage(url: imageString) { image, error in
                                guard let image = image else { return }
                                let newPokemon = CurrentPokemonModel(name: currentPockemon.name,
                                                                     url: currentPockemon.url,
                                                                     image: image)
                                pokemonsArray.append(newPokemon)
                                group.leave()
                            }
                        }
                    }
                }
                group.notify(queue: .main) {
                    self.activityIndicator.stopAnimating()
                    self.pokemons = pokemonsArray
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? PokemonInfoCell else {
            return UICollectionViewCell()
        }
        cell.pokemonName.text = pokemons[indexPath.item].name
        cell.pokemonImage.image = pokemons[indexPath.item].image
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension ListCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width - 20, height: 100)
    }
}
