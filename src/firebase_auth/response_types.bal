# email sign up response
# + idToken -  	A Firebase Auth ID token for the newly created user.
# + email - The email for the newly created user.
# + refreshToken - A Firebase Auth refresh token for the newly created user.
# + expiresIn - The number of seconds in which the ID token expires.
# + localId - The uid of the newly created user.
public type EmailSignUpResponse record {
    string idToken;
    string email;
    string refreshToken;
    string expiresIn;
    string localId;
};

# auth error
# + code - status code
# + message - error message
# + errs - array of errors occurs
# + causes - error couses

public type FirebaseAuthError record {
    int code?;
    string message;
    Scope[] errs?;
    error causes?;
};

# array of errors
# + message - error occure
# + domain - occured domain
# + reason - reason
public type Scope record {
    string message;
    string domain;
    string reason;
};
