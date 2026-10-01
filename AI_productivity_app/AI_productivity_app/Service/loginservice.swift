class Loginservice{
    func loginservice(username:String,password:String) -> Bool{
        //calling actual api in future
        
        if(username == "rehan" && password == "213" )
        {
            print("Can able to login")
        
                return true
        }
        else{
            print("Cannot login")
            return false
            }
    }
}
