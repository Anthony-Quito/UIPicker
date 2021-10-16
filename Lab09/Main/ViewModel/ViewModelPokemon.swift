//
//  ViewModelPokemon.swift
//  Lab09
//
//  Created by MAC05 on 15/10/21.
//

import Foundation

class ViewModelPokemon {
    
    //Función lambda  para refrescar la data
    var refreshData = {
        () -> () in
    }
    
    //Arreglo de datos para guardar datos
    var dataArrayPokemonList: [ListPokemon] = [] {
        didSet {
            refreshData()
        }
    }
    
    //Función para hacer petición a la API
    func getListPokemon() {
        //Se usará URLSession para extraer conteniodp de una URL
        //Se valida que la url no sea nula
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else { return }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else {return}
            
            do {
                let resultApi = try JSONDecoder().decode(Pokedex.self, from: data)
                    
                for pokemon in resultApi.results {
                    print(pokemon.name)
                    self.dataArrayPokemonList.append(pokemon)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
