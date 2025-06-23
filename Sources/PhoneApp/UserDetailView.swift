import SwiftUI

struct UserDetailView: View {
  var user: User
  
  var body: some View {
    List {
      LazyVGrid(columns: (0..<5).map { _ in .init(spacing: 0) }, spacing: 0) {
        Button {
          
        } label: {
          VStack {
            Image(systemName: "message.fill")
            Text("message")
              .font(.caption2)
          }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
                
        Button {
          
        } label: {
          VStack {
            Image(systemName: "phone.fill")
            Text("call")
              .font(.caption2)
          }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        
        Button {
          
        } label: {
          VStack {
            Image(systemName: "video.fill")
            Text("video")
              .font(.caption2)
          }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        
        
        Button {
          
        } label: {
          VStack {
            Image(systemName: "envelope.fill")
            Text("mail")
              .font(.caption2)
          }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        
        Button {
          
        } label: {
          VStack {
            Image(systemName: "dollarsign")
            Text("pay")
              .font(.caption2)
          }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
      }

      ForEach(0..<30) { _ in
        Text("Hello")
      }
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        VStack {
          Image(systemName: "person.circle")
          Text(user.name)
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    UserDetailView(user: .init(name: "080 1234 5578", icon: "person"))
  }
}
