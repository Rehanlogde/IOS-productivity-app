import SwiftUI

struct DashboardView: View {
    
    @State private var selectedItem: NavigationItem? = .dashboard
    
    enum NavigationItem: String, CaseIterable, Identifiable, Hashable {
        case dashboard
        case food
        case workouts
        case tasks
        case habits
        case work
        case notes
        case settings
        
        var id: String {
            rawValue
        }
        
        var title: String {
            switch self {
            case .dashboard:
                return "Dashboard"
            case .food:
                return "Food & Calories"
            case .workouts:
                return "Workouts"
            case .tasks:
                return "Tasks"
            case .habits:
                return "Habits"
            case .work:
                return "Work"
            case .notes:
                return "Notes"
            case .settings:
                return "Settings"
            }
        }
        
        var icon: String {
            switch self {
            case .dashboard:
                return "square.grid.2x2.fill"
            case .food:
                return "fork.knife"
            case .workouts:
                return "figure.strengthtraining.traditional"
            case .tasks:
                return "checklist"
            case .habits:
                return "repeat"
            case .work:
                return "briefcase.fill"
            case .notes:
                return "note.text"
            case .settings:
                return "gearshape.fill"
            }
        }
    }
    
    private let green = Color(
        red: 0.15,
        green: 0.85,
        blue: 0.45
    )
    
    var body: some View {
        
        NavigationSplitView {
            
            sidebar
            
        } detail: {
            
            detailView
        }
        .tint(green)
    }
    
    // MARK: - Sidebar
    
    private var sidebar: some View {
        
        List(selection: $selectedItem) {
            
            ForEach(NavigationItem.allCases) { item in
                
                Label(
                    item.title,
                    systemImage: item.icon
                )
                .tag(item)
            }
        }
        .navigationTitle("LifeOS")
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
    
    // MARK: - Detail View
    
    @ViewBuilder
    private var detailView: some View {
        
        switch selectedItem {
            
        case .dashboard:
            DashboardHomeView()
            
        case .food:
            Text("Food & Calories")
            
        case .workouts:
            Text("Workouts")
            
        case .tasks:
            Text("Tasks")
            
        case .habits:
            Text("Habits")
            
        case .work:
            Text("Work")
            
        case .notes:
            Text("Notes")
            
        case .settings:
            Text("Settings")
            
        case nil:
            DashboardHomeView()
        }
    }
}


// MARK: - Dashboard Home

struct DashboardHomeView: View {
    
    private let green = Color(
        red: 0.15,
        green: 0.85,
        blue: 0.45
    )
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Good Morning")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                
                Text("Let's make today productive.")
                    .foregroundStyle(.white.opacity(0.55))
                
                HStack(spacing: 16) {
                    
                    DashboardCard(
                        title: "Calories",
                        value: "0 kcal",
                        icon: "flame.fill"
                    )
                    
                    DashboardCard(
                        title: "Workout",
                        value: "Not Started",
                        icon: "figure.strengthtraining.traditional"
                    )
                }
                .padding(.top, 25)
                
                HStack(spacing: 16) {
                    
                    DashboardCard(
                        title: "Work",
                        value: "0 hrs",
                        icon: "briefcase.fill"
                    )
                    
                    DashboardCard(
                        title: "Tasks",
                        value: "0 / 0",
                        icon: "checklist"
                    )
                }
            }
            .padding(30)
        }
    }
}


// MARK: - Dashboard Card

struct DashboardCard: View {
    
    let title: String
    let value: String
    let icon: String
    
    private let green = Color(
        red: 0.15,
        green: 0.85,
        blue: 0.45
    )
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(green)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
            
            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(.white.opacity(0.06))
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}


#Preview {
    DashboardView()
}
