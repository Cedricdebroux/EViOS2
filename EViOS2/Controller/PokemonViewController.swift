//
//  PokemonViewController.swift
//  EViOS2
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokemons = [Pokemon]()
    
    @IBOutlet var pokemonTableView: UITableView!
    
    func loadPokemon(){
        pokemons.append(Pokemon(name: "Bulbizarre", image: UIImage(named: "Bulbizarre"), generation: 1,pokedexNumber: 001, height: 0.7, type: "Plante / Poisson" ))
        pokemons.append(Pokemon(name: "Herbizarre", image: UIImage(named: "Herbizarre"), generation: 2,pokedexNumber: 002, height: 1.0, type: "Plante / Poisson" ))
        pokemons.append(Pokemon(name: "Florizarre", image: UIImage(named: "Florizarre"), generation: 3,pokedexNumber: 003, height: 2.0, type: "Plante / Poisson" ))
        pokemons.append(Pokemon(name: "Salamèche", image: UIImage(named: "Salameche"), generation: 1,pokedexNumber: 004, height: 0.6, type: "Feu" ))
        pokemons.append(Pokemon(name: "Reptincel", image: UIImage(named: "Reptincel"), generation: 2,pokedexNumber: 005, height: 1.1, type: "Feu" ))
        pokemons.append(Pokemon(name: "Dracaufeu", image: UIImage(named: "Dracaufeu"), generation: 3,pokedexNumber: 006, height: 1.7, type: "Feu" ))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemon()
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        pokemonTableView.register(UINib(nibName: PokemonTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: PokemonTableViewCell.identifier)
       
        
        
    }
    
    
}

extension PokemonViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as?
                PokemonTableViewCell
        else {
            fatalError("no retrive")
        }
        cell.setup(pokemon: pokemons[indexPath.row])
        return cell
    }
}

extension PokemonViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 170
            }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailPokemonViewController = storyboard?.instantiateViewController(identifier: "DetailPokemonViewController") as? DetailPokemonViewController{
            detailPokemonViewController.pokemon = pokemons[indexPath.row]
            navigationController?.pushViewController(detailPokemonViewController, animated: true)
        }
    }
}
