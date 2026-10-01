import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false

    private let green = Color(red: 0.15, green: 0.85, blue: 0.45)

    var body: some View {
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

                    // MARK: - App Branding

                    VStack(spacing: 8) {
                        Text("LifeOS")
                            .font(.system(size: 44, weight: .bold))
                            .foregroundStyle(.white)

                        Text("Your day. Organized.")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.55))
                    }

                    // MARK: - Tagline

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

                    // MARK: - Login Form

                    VStack(spacing: 18) {

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))

                            TextField("Enter your email", text: $email)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .padding()
                                .background(
                                    Color.white.opacity(0.07)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(
                                            Color.white.opacity(0.1),
                                            lineWidth: 1
                                        )
                                )
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
                                    .foregroundStyle(
                                        .white.opacity(0.5)
                                    )
                                }
                            }
                            .padding()
                            .background(
                                Color.white.opacity(0.07)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(
                                        Color.white.opacity(0.1),
                                        lineWidth: 1
                                    )
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 14)
                            )
                            .foregroundStyle(.white)
                        }

                        // MARK: - Forgot Password

                        HStack {
                            Spacer()

                            Button("Forgot password?") {

                            }
                            .font(.footnote)
                            .foregroundStyle(green)
                        }

                        // MARK: - Sign In

                        Button {
                            login()
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

                    // MARK: - Divider

                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(
                                .white.opacity(0.12)
                            )

                        Text("or")
                            .font(.footnote)
                            .foregroundStyle(
                                .white.opacity(0.4)
                            )

                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(
                                .white.opacity(0.12)
                            )
                    }
                    .padding(.vertical, 28)

                    // MARK: - Sign Up

                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                            .foregroundStyle(
                                .white.opacity(0.55)
                            )

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
        }
    }

    private func login() {
        print("Email:", email)
        print("Password:", password)
    }
}

#Preview {
    LoginView()
}
