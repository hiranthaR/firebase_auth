import ballerina/http;
import hirantha/firebase_core as firebase;

# Object reference to firebase auth

public type FirebaseAuth object {

    private http:Client clientEndpoint;
    private firebase:Firebase app;

    # initialize firebase auth object with firebase app
    # + app - firebase app from hirantha/fireabse_core 
    public function __init(firebase:Firebase app) {
        self.app = app;
        self.clientEndpoint = new (FIREBASE_AUTH_API);
    }

    # signup user with email and password with firebase
    # + email - user provided email
    # +password - user provided password.should be more than 6 letters
    # + return - response from firebase
    public function signUpWithEmailAndPassword(string email, string password) returns @tainted EmailSignUpResponse | FirebaseAuthError {
        EmailAuthProvider emailAuthProvider = new (email, password);
        http:Request req = new;
        req.addHeader("Content-Type", "application/json");
        req.setJsonPayload(emailAuthProvider.getCredential());
        string url = self.api(FIREBASE_SIGNUP_API);
        http:Response | error response = wait start self.clientEndpoint-> post(url, req);
        return parseSignUpResposeToEmailAuthResponse(response);
    }

    # signin user with email and password with firebase
    # + email - user provided email
    # +password - user provided password.should be more than 6 letters
    # + return - response from firebase
    public function signInWithEmailAndPassword(string email, string password) returns @tainted EmailSignInResponse | FirebaseAuthError {
        EmailAuthProvider emailAuthProvider = new (email, password);
        http:Request req = new;
        req.addHeader("Content-Type", "application/json");
        req.setJsonPayload(emailAuthProvider.getCredential());
        string url = self.api(FIREBASE_SIGNIN_API);
        http:Response | error response = wait start self.clientEndpoint-> post(url, req);
        return parseSignInResposeToEmailAuthResponse(response);
    }


    # create api url with api token
    # + api - api to request
    # + return - request url 
    private function api(string api) returns string {
        return api + "?key=" + self.app.firebaseConfig.apiKey;
    }

};
