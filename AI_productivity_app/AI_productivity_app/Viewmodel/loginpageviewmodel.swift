class Loginviewmodel{
    var response = false
    func loginservicecall(username : String, password : String)-> Bool{
            
    let loginservicecall = Loginservice()
       response =  loginservicecall.loginservice(username : username, password : password)
        print("returning response" , response)
        return response
    }
}
