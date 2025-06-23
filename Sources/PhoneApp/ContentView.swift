import SwiftUI

enum TabItem: CaseIterable {
  case calls
  case contacts
  case keypad
  case search
  
  var title: LocalizedStringKey {
    switch self {
    case .calls: "Calls"
    case .contacts: "Contacts"
    case .keypad: "Keypad"
    case .search: "Search"
    }
  }
  
  var iconName: String {
    switch self {
    case .calls: "clock"
    case .contacts: "person.crop.circle.fill"
    case .keypad: "circle.grid.3x3.fill"
    case .search: "magnifyingglass"
    }
  }
}

struct ContentView: View {
  @State var selectedTab: TabItem = .calls
  @State var text = ""

  @ViewBuilder
  func tabView(_ tabItem: TabItem) -> some View {
    switch tabItem {
    case .calls: CallsView()
    case .contacts: ContactsView()
    case .keypad: KeypadView()
    case .search: SearchView()
    }
  }
  
  var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(TabItem.allCases, id: \.self) { tabItem in
        Tab(value: tabItem, role: tabItem == .search ? .search : nil) {
          tabView(tabItem)
        } label: {
          Label {
            Text(tabItem.title)
          } icon: {
            Image(systemName: tabItem.iconName)
          }
        }
      }
    }
    .searchable(text: $text)
  }
}


#Preview {
  ContentView()
}

extension Text {
  init(
    _ key: LocalizedStringKey,
    tableName: String? = nil,
    comment: StaticString? = nil
  ) {
    self.init(
      key,
      tableName: tableName,
      bundle: .module,
      comment: comment
    )
  }
}
