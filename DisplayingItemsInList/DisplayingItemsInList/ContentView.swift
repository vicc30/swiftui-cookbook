//
//  ContentView.swift
//  DisplayingItemsInList
//
//  Created by Victor Cruz Galindo on 04/06/22.
//

import SwiftUI

  //MARK: -  Radio buttons in List
struct ContentView: View {

  @State private var selectedChoice: String = ""
  let choices = ["Student", "Staff", "Faculty"]

  var body: some View {
    List(choices, id: \.self) { choice in
      HStack {
        Text(choice)
        Spacer()
          // circle.inset.filled
        Image(systemName: selectedChoice == choice ? "smallcircle.fill.circle": "circle")
          .onTapGesture {
            selectedChoice = choice
          }.font(.title)
          .foregroundColor(.blue)
      }
    }
  }
}


/*
//MARK: -  Create checkboxes in List
struct ContentView: View {

  @State private var selectedFruits: [String] = [String]()
  let fruits = ["Apple", "Orange", "Banana", "Cherry", "Coconut", "Kiwi"]

  var body: some View {
    VStack {
      List(fruits, id: \.self) { fruit in
        HStack {
          Text(fruit)
          Spacer()
          ZStack {

            if selectedFruits.contains(fruit) {
              Image(systemName: "checkmark.square.fill")
                .font(.largeTitle)
            } else {
              Image(systemName: "square")
                .font(.largeTitle)
            }


          }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .onTapGesture {
              if selectedFruits.contains(fruit) {
                selectedFruits = selectedFruits.filter { $0 != fruit }
              } else {
                selectedFruits.append(fruit)
              }
            }
        }

      }

      Text("Selected Fruits")
        .font(.title)

      List(selectedFruits, id: \.self) { fruit in
        Text(fruit)
      }
    }
  }
}
*/

/*
//MARK: -  Infinite Scrolling

struct ContentView: View {

  @StateObject private var numberListVM = NumberListViewModel()
  @State private var currentPage: Int = 1

  var body: some View {
    List(numberListVM.numbers, id: \.self) { number in
      Text("\(number)")
        .onAppear(perform: {
          if numberListVM.shouldLoadData(id: number) {
            currentPage += 1
            numberListVM.populateData(page: currentPage)
          }
        })
    }.onAppear(perform: {
      numberListVM.populateData(page: 1)
    })

  }

}
*/

/*
//MARK: -  Collapsible header

struct Place: Identifiable {
  let id = UUID()
  let name: String
  let hikes: [Hike]
}

struct Hike: Identifiable {
  let id = UUID()
  let name: String
}

private func getAllPlacesWithHikes() -> [Place] {
  return [Place(name: "Colorado", hikes: [Hike(name: "Trail Ridge"), Hike(name: "Flatirons"), Hike(name: "Maroon Bells Peaks")]),
          Place(name: "Oregon", hikes: [Hike(name: "Cascade Moutains"), Hike(name: "Crater Lake National Park")])
  ]
}

struct ContentView: View {

  @State private var places = getAllPlacesWithHikes()
  @State private var selectedName: String?
  @State private var expanded: Bool = false

  var body: some View {
    List(places) { place in
      VStack(alignment: .leading) {
        HStack {
          Text(place.name)
            .fontWeight(.bold)
            .padding(.bottom, 10)
          Spacer()
          Image(systemName: selectedName == place.name ? "chevron.down": "chevron.right")

        }
        .contentShape(Rectangle())
        .onTapGesture(perform: {
          expanded.toggle()
          selectedName = expanded ? place.name: nil
        })

        if selectedName == place.name {
          ForEach(place.hikes) { hike in
            Text(hike.name)
          }
        }
      }
    }
  }
}

*/


/*

//MARK: -  Select multiple items

struct Customer: Identifiable {
  let id = UUID()
  let name: String
}


struct ContentView: View {

  @State private var customers = [
    Customer(name: "Vic"), Customer(name: "Marian"), Customer(name: "Rich"), Customer(name: "Mike"), Customer(name: "Oscar")]

  @State private var selectedCustomerId = Set<UUID>()

  var body: some View {

    NavigationView {
      List(customers, selection: $selectedCustomerId) { customer in
        HStack {
          Text(customer.name)
          Spacer()
        }
      }.toolbar {
        EditButton()
      }.navigationTitle("Selected \(selectedCustomerId.count)")

    }
  }
}
*/

/*

//MARK: -  Swipe actions to list
struct Place: Identifiable {
  let id = UUID()
  let name: String
  let photo: String
}

func getPlaces() -> [Place] {
  return [Place(name: "Denver", photo: "denver"),
          Place(name: "Newyork", photo: "ny"),
          Place(name: "Costa Rica", photo: "costa-rica"),
          Place(name: "Seattle", photo: "seattle"),
          Place(name: "Cuba", photo: "cuba")
  ]
}

struct ContentView: View {

  @State private var search: String = ""
  @State private var places = getPlaces()

  var body: some View {

    NavigationView {
      List(places) { place in
        HStack(alignment: .top) {
          Image(place.photo)
            .resizable()
            .frame(maxWidth: 100, maxHeight: 100)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

          Text(place.name)
            .font(.title)
        }.swipeActions(edge: .leading) {
          Button {
            // action
          } label: {
            Label("Heart", systemImage: "heart.circle")
          }.tint(.yellow)
        }.swipeActions(edge: .leading) {
          Button {
            // Action
          } label: {
            Label("Heart", systemImage: "heart.circle")
          }.tint(.teal)
        }.swipeActions(edge: .trailing) {
          Button {
              // Action
          } label: {
            Label("Archive", systemImage: "archivebox.circle.fill")
          }.tint(.teal)

        }
      }.listStyle(.plain)
        .navigationTitle("Places")
    }
  }
}
*/

  // MARK: Pull to refresh list
  //
  //struct ContentView: View {
  //
  //  @State private var refreshDates: [Date] = []
  //
  //  var body: some View {
  //
  //    NavigationView {
  //
  //      List(refreshDates, id: \.self) { date in
  //        Text("\(date)")
  //      }.listStyle(.plain)
  //        .refreshable {
  //          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
  //            let currentDate = Date()
  //            refreshDates.append(currentDate)
  //          }
  //        }
  //
  //
  //        .navigationTitle("Pull to Refresh")
  //    }
  //  }
  //}




/*
//MARK: -  Autoscroll to a particualr section
struct ContentView: View {

  var body: some View {

    ScrollViewReader { proxy in
      VStack {

        Button("Scroll to 100") {
          withAnimation {
            proxy.scrollTo(100)
          }
        }

        List(1...500, id: \.self) { index in
          Text("\(index)")
            .id(index)
        }
      }

    }
  }
}
*/


/*
//MARK: -  All row clickable
struct ContentView: View {

  @State private var selectedIndex: Int?

  var body: some View {

    VStack {
      List {
        ForEach(1...10, id: \.self) { index in
          HStack {
            Text("\(index)")
            Spacer()
          }
          .contentShape(Rectangle())
          .onTapGesture(perform: {
            selectedIndex = index
          })
        }
      }

      selectedIndex.map {
        Text("\($0)")
          .font(.largeTitle)
      }
    }
  }
}
*/

/*
// MARK: Filter results

struct Place: Identifiable {
  let id = UUID()
  let name: String
  let photo: String
}

func getPlaces() -> [Place] {
  return [Place(name: "Denver", photo: "denver"),
          Place(name: "Newyork", photo: "ny"),
          Place(name: "Costa Rica", photo: "costa-rica"),
          Place(name: "Seattle", photo: "seattle"),
          Place(name: "Cuba", photo: "cuba")
  ]
}

struct ContentView: View {

  @State private var search: String = ""
  @State private var places = getPlaces()

  var body: some View {

    NavigationView {
      List(places) { place in
        HStack(alignment: .top) {
          Image(place.photo)
            .resizable()
            .frame(maxWidth: 100, maxHeight: 100)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

          Text(place.name)
            .font(.title)
        }
      }.listStyle(.plain)
        .searchable(text: $search)
        .onChange(of: search, perform: { value in
          if !value.isEmpty && value.count >= 1 {
            places = places.filter {
              $0.name.lowercased().hasPrefix(value.lowercased())
            }
          } else {
            places = getPlaces()
          }
        })


        .navigationTitle("Places")
    }
  }
}

 */

// MARK: Pull to refresh list
//
//struct ContentView: View {
//
//  @State private var refreshDates: [Date] = []
//
//  var body: some View {
//
//    NavigationView {
//
//      List(refreshDates, id: \.self) { date in
//        Text("\(date)")
//      }.listStyle(.plain)
//        .refreshable {
//          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            let currentDate = Date()
//            refreshDates.append(currentDate)
//          }
//        }
//
//
//        .navigationTitle("Pull to Refresh")
//    }
//  }
//}



/*

//  MARK: Change background color
struct ContentView: View {

  init() {
    // UITableView.appearance().backgroundColor = UIColor.yellow
  }

  var body: some View {
    NavigationView {

      ScrollView {
        LazyVStack(spacing: 10) {
          ForEach(1...10, id: \.self) { index in
            HStack {
              VStack(alignment: .leading) {
                Text("\(index)")
                Divider()
              }
              Spacer()
            }
          }
        }.background(Color.yellow)
      }.background(Color.green)


      /*
      List {
        ForEach(1...5, id: \.self) { index in
          HStack {
            Text("\(index)")
            Spacer()
          }.listRowBackground(Color.green)
        }
      }.listStyle(.inset)
       */
    }
  }
*/

/*
struct Post: Identifiable {
  let id = UUID()
  let title: String
  let comments: [Comment]
}

struct Comment: Identifiable {
  let id = UUID()
  let title: String
}
*/

//  MARK: Group Items
//  let posts = [
//    Post(title: "Post 1", comments: [Comment(title: "Comment 1 post 1"), Comment(title: "Comment 1 post 1")]),
//    Post(title: "Post 2", comments: [Comment(title: "Comment 1 post 2"), Comment(title: "Comment 2 post 2")])
//  ]
//
//  var body: some View {
//    NavigationView {
//      List {
//        ForEach(posts) { post in
//          Section(header: Text(post.title)) {
//            ForEach(post.comments) { comment in
//              Text(comment.title)
//            }
//          }
//        }
//      }.listStyle(.grouped)
//    }
//  }


//  MARK: Remove separate style
//
//  var body: some View {
//    NavigationView {
//      List(1...20, id: \.self) { index in
//        HStack {
//          Text("\(index)")
//          Spacer()
//        }.listRowSeparator(.hidden)
//      }.listStyle(.plain)
//    }
//  }


//  MARK: Add, remove, move item
//
//  @State private var taskName: String = ""
//  @State private var tasks: [String] = []
//
//  private func deleteTask(indexSet: IndexSet) {
//    indexSet.forEach { index in
//      tasks.remove(at: index)
//    }
//  }
//
//  private func moveTask(indexSet: IndexSet, to destination: Int) {
//    tasks.move(fromOffsets: indexSet, toOffset: destination)
//  }
//
//
//  var body: some View {
//    NavigationView {
//      VStack {
//
//        HStack {
//          TextField("Enter task name", text: $taskName)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//          Button("Add task") {
//            tasks.append(taskName)
//            taskName = ""
//          }
//        }
//
//        List {
//          ForEach(tasks, id: \.self) { task in
//            Text(task)
//          }.onDelete(perform: deleteTask)
//            .onMove(perform: moveTask)
//        }.listStyle(.plain)
//          .toolbar {
//            EditButton()
//          }
//
//      }.padding()
//    }
//  }

//  MARK: Display alternate style in rows
//  let animals = ["🐕", "🦓", "🐂", "🐅", "🐇", "🦛", "🦒"]
//
//  var body: some View {
//    List(animals.indices, id: \.self) { index in
//      let animal = animals[index]
//      HStack {
//        Text(animal)
//          .font(.largeTitle)
//        Spacer()
//      }.background(index % 2 == 0 ? Color.green : Color.gray)
//
//    }
//  }


//}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

