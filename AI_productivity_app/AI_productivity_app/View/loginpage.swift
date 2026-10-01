import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var navigateToDashboard = false
    var loginvm = Loginviewmodel()
    @State var showalert = false;
    var loginservice = Loginservice()
    private let green = Color(red: 0.15, green: 0.85, blue: 0.45)
        
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color.black,
                        Color(red: 0.02, green: 0.12, blue: 0.07),
                        Color.black
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {

                        Spacer(minLength: 55)

                        VStack(spacing: 8) {
                            Text("LifeOS")
                                .font(.system(size: 44, weight: .bold))
                                .foregroundStyle(.white)

                            Text("Your day. Organized.")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.55))
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Good habits.")
                                .foregroundStyle(.white)

                            Text("Better work.")
                                .foregroundStyle(.white)

                            Text("Stronger you.")
                                .foregroundStyle(green)
                        }
                        .font(.system(size: 29, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 55)

                        VStack(spacing: 18) {

                            VStack(alignment: .leading, spacing: 8) {
                                Text("Email")
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.7))

                                TextField("Enter your email", text: $email)
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.emailAddress)
                                    .padding()
                                    .background(.white.opacity(0.07))
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 14)
                                    )
                                    .foregroundStyle(.white)
                            }

                            VStack(alignment: .leading, spacing: 8) {
                                Text("Password")
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.7))

                                HStack {
                                    if showPassword {
                                        TextField(
                                            "Enter your password",
                                            text: $password
                                        )
                                    } else {
                                        SecureField(
                                            "Enter your password",
                                            text: $password
                                        )
                                    }

                                    Button {
                                        showPassword.toggle()
                                    } label: {
                                        Image(
                                            systemName: showPassword
                                            ? "eye.slash"
                                            : "eye"
                                        )
                                        .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding()
                                .background(.white.opacity(0.07))
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 14)
                                )
                                .foregroundStyle(.white)
                            }

                            HStack {
                                Spacer()

                                Button("Forgot password?") {

                                }
                                .font(.footnote)
                                .foregroundStyle(green)
                            }

                            Button {
                                
                                let usermodel = User(username: email, password: password)
                                navigateToDashboard =  loginvm.loginservicecall(username: usermodel.username, password: usermodel.pasword)
                                print("this is the navigationvalue : ", navigateToDashboard)
                                showalert =
                                !navigateToDashboard
                                print("This is the alert value : ", showalert)
                            } label: {
                                Text("Sign In")
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(green)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 14)
                                    )
                            }
                            .padding(.top, 8)
                        }
                        .padding(.top, 40)

                        HStack {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white.opacity(0.12))

                            Text("or")
                                .font(.footnote)
                                .foregroundStyle(.white.opacity(0.4))

                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white.opacity(0.12))
                        }
                        .padding(.vertical, 28)

                        HStack(spacing: 5) {
                            Text("Don't have an account?")
                                .foregroundStyle(.white.opacity(0.55))

                            Button("Sign Up") {

                            }
                            .foregroundStyle(green)
                            .fontWeight(.semibold)
                        }
                        .font(.footnote)

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 28)
                }
            }.alert("Invalid Credentials", isPresented:$showalert              ) {
                Button("Click to Retry") {
                           
                    $navigateToDashboard.wrappedValue = false
                    email = ""
                    password = ""
                    
                       }
            }
            .navigationDestination(isPresented: $navigateToDashboard) {
                DashboardView()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    
}

#Preview {
    LoginView()
}
