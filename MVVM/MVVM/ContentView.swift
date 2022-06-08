//
//  ContentView.swift
//  MVVM
//
//  Created by Victor Cruz Galindo on 07/06/22.
//

import SwiftUI

struct ContentView: View {

  @StateObject private var postListVM = PostListViewModel()

  var body: some View {
    List(postListVM.posts, id: \.id ) { post in
      VStack(alignment: .leading, spacing: 10) {
        Text(post.title.uppercased())
          .font(.headline)
        Text(post.body)
      }
    }.onAppear {
      postListVM.populatePosts()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
