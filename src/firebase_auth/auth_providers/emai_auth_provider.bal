public type EmailAuthProvider object {
    public string providerId = "passowrd";
    private string email;
    private string password;

    public function __init(string email, string password) {
        self.email = email;
        self.password = password;
    }

    public function getCredential() returns json {
        json credential = {
            email: self.email,
            password: self.password,
            returnSecureToken: true
        };
        return credential;
    }
};
