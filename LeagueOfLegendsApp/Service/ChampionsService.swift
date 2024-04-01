//
//  ChampionsService.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import Foundation
import UIKit

enum ErrorDetail: Swift.Error {
    case errorURL(urlString: String)
    case detail(detail: String)
}

class ChampionsService {
    
    func getChampions(completion: @escaping (ChampionsData?, Error?) -> Void) {
        let urlString = "https://ddragon.leagueoflegends.com/cdn/14.6.1/data/pt_BR/champion.json"
        
        guard let url: URL = URL(string: urlString) else {return completion(nil, ErrorDetail.errorURL(urlString: urlString))}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let dataResult = data else {return completion(nil, ErrorDetail.detail(detail: "Error data"))}
            
            let json = try? JSONSerialization.jsonObject(with: dataResult, options: [])
            print(json as Any)
            
            guard let response = response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                do {
                    let homeData = try JSONDecoder().decode(ChampionsData.self, from: dataResult)
                    completion(homeData, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        
        task.resume()
    }

    func getChampionDetail(championId: String, completion: @escaping (ChampionDetailData?, Error?) -> Void) {
        let urlString = "https://ddragon.leagueoflegends.com/cdn/14.6.1/data/pt_BR/champion/\(championId).json"
        
        guard let url: URL = URL(string: urlString) else {return completion(nil, ErrorDetail.errorURL(urlString: urlString))}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let dataResult = data else {return completion(nil, ErrorDetail.detail(detail: "Error data"))}
            
            let json = try? JSONSerialization.jsonObject(with: dataResult, options: [])
            print(json as Any)
            
            guard let response = response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                do {
                    let homeData = try JSONDecoder().decode(ChampionDetailData.self, from: dataResult)
                    completion(homeData, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
}
