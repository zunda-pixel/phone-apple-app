import SwiftUI

struct History: Identifiable {
  var id = UUID()
  var user: User
  var type: String
  var date: Date
  var successReceived: Bool
}

struct User {
  var id = UUID()
  var name: String
  var icon: String
}

struct CallsView: View {
  @State var mode: Mode = .missied
  @State var editMode: EditMode = .inactive
  @State var selectedHistoryIds: Set<History.ID> = []
  @State var histories: [History] = [
    .init(user: .init(name: "Text", icon: "Icon"), type: "phone", date: .now.addingTimeInterval(-1), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "Tokyo", date: .now.addingTimeInterval(-10), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "New York", date: .now.addingTimeInterval(-100), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "unknown", date: .now.addingTimeInterval(-1000), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "Japan", date: .now.addingTimeInterval(-10000), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "Tokyo", date: .now.addingTimeInterval(-100000), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "phone", date: .now.addingTimeInterval(-1000000), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "unknown", date: .now.addingTimeInterval(-10000000), successReceived: Bool.random()),
    .init(user: .init(name: "Text", icon: "Icon"), type: "Tokyo", date: .now.addingTimeInterval(-100000000), successReceived: Bool.random()),
  ]
  
  var body: some View {
    NavigationStack {
      List(selection: $selectedHistoryIds) {
        ForEach(histories.sorted(using: KeyPathComparator(\.date, order: .reverse))) { history in
          HStack {
            Image(systemName: "person.fill")
              .resizable()
              .foregroundStyle(.white)
              .frame(width: 42, height: 42)
              .clipShape(.circle)
              .padding(4)
              .background(Color.gray.opacity(0.5), in: .circle)
            
            VStack(alignment: .leading) {
              Text(history.user.name)
                .foregroundStyle(history.successReceived ? Color.primary : Color.red)
                .bold()
              Text(history.type)
                .foregroundStyle(.secondary)
            }
            Spacer()
            Text(history.date, style: .relative)
              .foregroundStyle(.secondary)
              .font(.caption)
            Text("123")
            Button {
              
            } label: {
              Image(systemName: "phone.fill")
                .imageScale(.large)
                .foregroundStyle(.blue)
            }
            .buttonStyle(.glass)
            .buttonSizing(.flexible)
          }
          .tag(history.id)
          .contextMenu {
            Button {
              
            } label: {
              Label {
                Text("Add to Existing Contact")
              } icon: {
                Image(systemName: "person.crop.circle.badge.plus")
              }
            }
            Button {
              
            } label: {
              Label {
                Text("Create New Contact")
              } icon: {
                Image(systemName: "person.crop.circle")
              }
            }
          }
          .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button(role: .destructive) {
              histories.removeAll(where: { $0.id == history.id })
            } label: {
              Image(systemName: "trash")
            }
          }
          .swipeActions(edge: .trailing) {
            Menu {
              
            } label: {
              Image(systemName: "clock")
                .tint(.blue)
            }
          }
        }
      }
      .environment(\.editMode, $editMode)
      .navigationTitle("Calls")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        #if !os(macOS)
        ToolbarItem(placement: .topBarLeading) {
          if editMode == .inactive {
            Menu {
              Button {
                
              } label: {
                Label("Name and Photo Sharing", systemImage: "person.crop.circle")
              }
              Divider()
              Button {
                
              } label: {
                Label("Edit Favorites", systemImage: "star")
              }
              Divider()
              Button {
                self.editMode = .active
              } label: {
                Label("Select", systemImage: "checkmark.circle")
              }
            } label: {
              Text("Edit")
            }
          } else {
            Button {
              self.editMode = .inactive
            } label: {
              Image(systemName: "checkmark")
            }
          }
        }
        #endif
        ToolbarItem(placement: .topBarTrailing) {
          Menu {
            Divider()
            Picker("Select Mode", selection: $mode) {
              ForEach(Mode.allCases, id: \.self) { mode in
                Label(mode.title, systemImage: mode.imageName)
              }
            }
            .pickerStyle(.inline)
            Divider()
            Button {
              
            } label: {
              Text("Manage Filtering")
            }
          } label: {
            Image(systemName: "line.3.horizontal.decrease")
          }
        }
        if self.editMode == .active {
          ToolbarItem(placement: .bottomBar) {
            Button(role: .destructive) {
              
            } label: {
              Text("Mark as Read")
            }
          }
          ToolbarSpacer(.fixed, placement: .bottomBar)
          ToolbarItem(placement: .bottomBar) {
            Button(role: .destructive) {
              self.histories.removeAll(where: { self.selectedHistoryIds.contains($0.id) })
            } label: {
              Text("Delete")
            }
            .disabled(self.selectedHistoryIds.isEmpty)
          }
        }
      }
    }
  }
}

extension CallsView {
  enum Mode: CaseIterable {
    case calls
    case missied
    case voicemails
    case unknownCallers
    case spam
    
    var title: LocalizedStringKey {
      switch self {
      case .calls: "Calls"
      case .missied: "Missed"
      case .voicemails: "Voicemails"
      case .unknownCallers: "Unknown Callers"
      case .spam: "Spam"
      }
    }
    
    var imageName: String {
      switch self {
      case .calls: "phone"
      case .missied: "square"
      case .voicemails: "recordingtape"
      case .unknownCallers: "person.crop.circle.badge.questionmark"
      case .spam: "xmark.bin"
      }
    }
  }
}

#Preview {
  CallsView()
}
