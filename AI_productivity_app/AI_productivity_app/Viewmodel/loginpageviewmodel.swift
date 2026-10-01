class Loginviewmodel{
    var response = false
    func loginservicecall(username : String, password : String){
            
    let loginservicecall = Loginservice()
       response =  loginservicecall.loginservice(username : username, password : password)
    
    }
}
