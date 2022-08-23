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
        pokemons.append(Pokemon(name: "Bulbizarre", image: UIImage(named: "Bulbizarre")))
        pokemons.append(Pokemon(name: "Herbizarre", image: UIImage(named: "Herbizarre")))
        pokemons.append(Pokemon(name: "Florizarre", image: UIImage(named: "Florizarre")))
        pokemons.append(Pokemon(name: "Salamèche", image: UIImage(named: "Salameche")))
        pokemons.append(Pokemon(name: "Reptincel", image: UIImage(named: "Reptincel")))
        pokemons.append(Pokemon(name: "Dracaufeu", image: UIImage(named: "Dracaufeu")))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemon()
        
        pokemonTableView.register(UINib(nibName: PokemonTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: PokemonTableViewCell.identifier)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PokemonViewController: UITableViewDataSource{
    

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    pokemons.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: IndexPath) as?
            PokemonTableViewCell
    else {
        fatalError("no retrive")
    }
    cell.setup(pokemon: pokemons[indexPath.row])
    return cell
}
}
