
import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    @State private var showMenu = false

    var body: some View {
        ZStack(alignment: .leading) {

            TabView(selection: $selectedTab) {

                HomeView(showMenu: $showMenu)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)

                DemoView(title: "Insights", icon: "chart.bar.fill")
                    .tabItem {
                        Image(systemName: "chart.bar.fill")
                        Text("Insights")
                    }
                    .tag(1)

                DemoView(title: "Tasks", icon: "checkmark.circle.fill")
                    .tabItem {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Tasks")
                    }
                    .tag(2)

                DemoView(title: "Profile", icon: "person.fill")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .tint(Color.green)

            if showMenu {
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showMenu = false
                    }

                MenuView(showMenu: $showMenu)
                    .transition(.move(edge: .leading))
            }
        }
    }
}


// MARK: HOME

struct HomeView: View {
    @Binding var showMenu: Bool

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    header

                    progressCard

                    Text("Today's Statistics")
                        .font(.title3.bold())
                        .foregroundColor(.white)

                    statistics

                    Text("Weekly Activity")
                        .font(.title3.bold())
                        .foregroundColor(.white)

                    weeklyChart

                    Text("Today's Focus")
                        .font(.title3.bold())
                        .foregroundColor(.white)

                    focusItem(
                        icon: "figure.run",
                        title: "Workout",
                        subtitle: "45 minutes training",
                        completed: true
                    )

                    focusItem(
                        icon: "briefcase.fill",
                        title: "Work",
                        subtitle: "Complete project task",
                        completed: false
                    )

                    focusItem(
                        icon: "book.fill",
                        title: "Study",
                        subtitle: "Practice SwiftUI",
                        completed: false
                    )
                }
                .padding(20)
            }
            .background(Color.black)
            .scrollContentBackground(.hidden)
            .toolbar(.hidden, for: .navigationBar)
        }
    }


    // MARK: HEADER

    private var header: some View {
        HStack {

            Button {
                withAnimation {
                    showMenu = true
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.white.opacity(0.08))
                    .clipShape(Circle())
            }

            VStack(alignment: .leading) {
                Text("Good evening")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))

                Text("Rehan")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }

            Spacer()

            Button {
            } label: {
                Image(systemName: "bell")
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.white.opacity(0.08))
                    .clipShape(Circle())
            }
        }
    }


    // MARK: PROGRESS

    private var progressCard: some View {
        HStack {

            VStack(alignment: .leading, spacing: 8) {

                Text("TODAY'S PROGRESS")
                    .font(.caption.bold())
                    .foregroundColor(.green)

                Text("You're on track.")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                Text("68% of your daily goals completed.")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))

                Text("+12% from yesterday")
                    .font(.caption.bold())
                    .foregroundColor(.green)
            }

            Spacer()

            ZStack {

                Circle()
                    .stroke(
                        Color.white.opacity(0.1),
                        lineWidth: 9
                    )

                Circle()
                    .trim(from: 0, to: 0.68)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 9,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))

                Text("68%")
                    .font(.headline.bold())
                    .foregroundColor(.white)
            }
            .frame(width: 85, height: 85)
        }
        .padding(20)
        .frame(height: 170)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.02, green: 0.18, blue: 0.09),
                    Color(red: 0.01, green: 0.06, blue: 0.03)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }


    // MARK: STATISTICS

    private var statistics: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            spacing: 12
        ) {

            statCard(
                icon: "flame.fill",
                title: "Calories",
                value: "1,840",
                unit: "kcal"
            )

            statCard(
                icon: "figure.strengthtraining.traditional",
                title: "Workout",
                value: "52",
                unit: "min"
            )

            statCard(
                icon: "briefcase.fill",
                title: "Work",
                value: "5.2",
                unit: "hours"
            )

            statCard(
                icon: "checkmark.circle.fill",
                title: "Tasks",
                value: "4/6",
                unit: "done"
            )
        }
    }


    private func statCard(
        icon: String,
        title: String,
        value: String,
        unit: String
    ) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 35, height: 35)
                .background(Color.green.opacity(0.12))
                .clipShape(Circle())

            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))

            HStack(alignment: .firstTextBaseline, spacing: 4) {

                Text(value)
                    .font(.title2.bold())
                    .foregroundColor(.white)

                Text(unit)
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.4))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .frame(height: 145)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }


    // MARK: WEEKLY CHART

    private var weeklyChart: some View {

        HStack(alignment: .bottom, spacing: 12) {

            bar(value: 0.4, day: "M")
            bar(value: 0.65, day: "T")
            bar(value: 0.5, day: "W")
            bar(value: 0.8, day: "T")
            bar(value: 0.7, day: "F")
            bar(value: 0.95, day: "S")
            bar(value: 0.6, day: "S")
        }
        .frame(height: 160)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
        .padding(.top, 15)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }


    private func bar(value: CGFloat, day: String) -> some View {

        VStack(spacing: 8) {

            Spacer()

            RoundedRectangle(cornerRadius: 5)
                .fill(Color.green)
                .frame(height: 100 * value)

            Text(day)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.5))
        }
    }


    // MARK: FOCUS

    private func focusItem(
        icon: String,
        title: String,
        subtitle: String,
        completed: Bool
    ) -> some View {

        HStack {

            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 42, height: 42)
                .background(Color.green.opacity(0.1))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {

                Text(title)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }

            Spacer()

            Image(
                systemName: completed
                ? "checkmark.circle.fill"
                : "circle"
            )
            .foregroundColor(
                completed
                ? .green
                : .white.opacity(0.25)
            )
        }
        .padding(15)
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}


// MARK: SIDE MENU

struct MenuView: View {

    @Binding var showMenu: Bool

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack {

                VStack(alignment: .leading) {

                    Text("LifeOS")
                        .font(.title.bold())
                        .foregroundColor(.white)

                    Text("Your day. Organized.")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }

                Spacer()

                Button {
                    withAnimation {
                        showMenu = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .frame(width: 38, height: 38)
                        .background(Color.white.opacity(0.08))
                        .clipShape(Circle())
                }
            }

            Divider()
                .background(Color.white.opacity(0.2))
                .padding(.vertical, 15)

            menuButton(icon: "house.fill", title: "Dashboard")
            menuButton(icon: "fork.knife", title: "Nutrition")
            menuButton(icon: "figure.run", title: "Workout")
            menuButton(icon: "briefcase.fill", title: "Work")
            menuButton(icon: "target", title: "Goals")
            menuButton(icon: "calendar", title: "Calendar")
            menuButton(icon: "gearshape.fill", title: "Settings")

            Spacer()

            HStack {

                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 45, height: 45)
                    .overlay {
                        Text("R")
                            .foregroundColor(.green)
                            .font(.headline.bold())
                    }

                VStack(alignment: .leading) {

                    Text("Rehan")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())

                    Text("Personal Account")
                        .foregroundColor(.white.opacity(0.4))
                        .font(.caption)
                }
            }
            .padding(.bottom, 25)
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
        .frame(width: 290)
        .frame(maxHeight: .infinity)
        .background(Color(red: 0.015, green: 0.025, blue: 0.02))
        .ignoresSafeArea()
    }


    private func menuButton(
        icon: String,
        title: String
    ) -> some View {

        Button {
        } label: {

            HStack(spacing: 15) {

                Image(systemName: icon)
                    .frame(width: 25)

                Text(title)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.25))
            }
            .foregroundColor(.white.opacity(0.8))
            .padding(.horizontal, 15)
            .frame(height: 48)
            .background(Color.white.opacity(0.04))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}


// MARK: DEMO SCREEN

struct DemoView: View {

    let title: String
    let icon: String

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            VStack(spacing: 15) {

                Image(systemName: icon)
                    .font(.system(size: 45))
                    .foregroundColor(.green)

                Text(title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Coming soon")
                    .foregroundColor(.white.opacity(0.5))
            }
        }
    }
}


// MARK: PREVIEW

#Preview {
    DashboardView()
}
