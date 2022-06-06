//
//  ContentView.swift
//  DisplayingItemsInList
//
//  Created by Victor Cruz Galindo on 04/06/22.
//

import SwiftUI

struct ContentView: View {

  let animals = ["🐕", "🦓", "🐂", "🐅", "🐇", "🦛", "🦒"]

  var body: some View {
    List(animals.indices, id: \.self) { index in
      let animal = animals[index]
      HStack {
        Text(animal)
          .font(.largeTitle)
        Spacer()
      }.background(index % 2 == 0 ? Color.green : Color.gray)

    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

