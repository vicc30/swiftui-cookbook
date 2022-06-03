//
//  ContentView.swift
//  DisplayItemsInList
//
//  Created by Victor Cruz Galindo on 03/06/22.
//

import SwiftUI

struct Friend: Identifiable {
  var id = UUID()
  let name: String
}

struct ContentView: View {

  let friends = [Friend(name: "Lic"), Friend(name: "Mari"), Friend(name: "Cam")]

//  var body: some View {
//    // We can remove id as a parameter
//    // List(friends, id: \.id) ...
//    List(friends) { friend in
//      Text(friend.name)
//    }
//  }

  var body: some View {
    List(friends.indices) { index in
      let friend = friends[index]
      HStack {
        Text("\(index + 1)")
        Text(friend.name)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
