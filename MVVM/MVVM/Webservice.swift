//
//  Webservice.swift
//  MVVM
//
//  Created by Victor Cruz Galindo on 07/06/22.
//

import Foundation

enum NetworkError: Error {
  case badUrl
  case badRequest

}

class Webservice {
  func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {

    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
      completion(.failure(.badUrl))
      return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completion(.failure(.badRequest))
        return
      }

      let posts = try? JSONDecoder().decode([Post].self, from: data)
      completion(.success(posts ?? []))

    }.resume()

  }
}
