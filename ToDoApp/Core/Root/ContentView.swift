//
//  ContentView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var currentTab: Tab = .Home
    @Namespace private var tabNamespace
    
    //Hide Native Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView (selection: $currentTab){
            HomeView().tag(Tab.Home)
            NewTaskView().tag(Tab.AddTask)
            PendingTasksView().tag(Tab.TodayTasks)
            ProfileView().tag(Tab.Profile)
        } .overlay (
            HStack (spacing: 0){
                ForEach (Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color.white)
            }
            , alignment: .bottom
            )
        .ignoresSafeArea(.all, edges: .bottom)
        }
    
    func TabButton(tab: Tab) -> some View {
        GeometryReader{ proxy in
            
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }, label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(currentTab == tab ? Color("PrimaryColor") : .secondary)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: tabNamespace)
                                    
                                    Text(tab.tabName).foregroundStyle(Color("PrimaryColor"))
                                        .font(.footnote).padding(.top, 50)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -20 : 0)
                }
            })
            
        }
        .frame(height:25)
    }
    }


//Enum for Tab changes
enum Tab: String, CaseIterable {
    case Home = "house.circle.fill"
    case AddTask = "plus.circle.fill"
    case TodayTasks = "calendar.circle.fill"
    case Profile = "person.circle.fill"
    
    var tabName: String {
        switch self {
        case .Home:
            return "Home"
        case .AddTask:
            return "Add Task"
        case .TodayTasks:
            return "Tasks"
        case .Profile:
            return "Profile"
        }
    }
}

//Safe Area for Bottom Bar
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        guard let SafeArea = screen.windows.first?.safeAreaInsets else { return .zero }
        return SafeArea
    }
}


struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}


//Dunb Data for the preview to work
@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Task.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for index in 1...5 {
            let newTask = Task(title: "Task \(index)", priority: .normal, category: .study, date: Date(), time: Date())
            container.mainContext.insert(newTask)
        }
        return container
    } catch {
        fatalError("Error al crear el container")
    }
} ()
