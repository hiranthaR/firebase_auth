import ballerina/http;

#  Check for HTTP response and if response is success parse HTTP response object into SimailSignUpResponse and parse error otherwise.
# + response - Http response or HTTP connector error with network related errors
# + return - EmailSignUpResponse or `FirebaseAuthError` if anything wrong happen when HTTP client invocation or parsing response to json
function parseSignUpResposeToEmailAuthResponse(http:Response | error response) returns @tainted EmailSignUpResponse | FirebaseAuthError {
    if (response is http:Response) {
        var jsonPayload = response.getJsonPayload();
        if (jsonPayload is json) {
            if (response.statusCode != http:STATUS_OK && response.statusCode != http:STATUS_CREATED) {
                FirebaseAuthError authError = {
                    message: response.statusCode.toString() + " "
                    + response.reasonPhrase + " - " + jsonPayload.toString()
                };
                return authError;
            }
            EmailSignUpResponse | error signupRes = EmailSignUpResponse.constructFrom(jsonPayload);
            if (signupRes is EmailSignUpResponse) {
                return signupRes;
            } else {
                FirebaseAuthError authError = {
                    message: "Error occurred when parsing response to json.",
                    causes: signupRes
                };
                return authError;
            }
        } else {
            FirebaseAuthError authError = {
                message: "Error occurred when parsing response to json.",
                causes: jsonPayload
            };
            return authError;
        }

    } else {
        FirebaseAuthError authError = {
            message: response.reason(),
            causes: response
        };
        return authError;
    }
}

#  Check for HTTP response and if response is success parse HTTP response object into SimailSignInResponse and parse error otherwise.
# + response - Http response or HTTP connector error with network related errors
# + return - EmailSignInResponse or `FirebaseAuthError` if anything wrong happen when HTTP client invocation or parsing response to json
function parseSignInResposeToEmailAuthResponse(http:Response | error response) returns @tainted EmailSignInResponse | FirebaseAuthError {
    if (response is http:Response) {
        var jsonPayload = response.getJsonPayload();
        if (jsonPayload is json) {
            if (response.statusCode != http:STATUS_OK && response.statusCode != http:STATUS_CREATED) {
                FirebaseAuthError authError = {
                    message: response.statusCode.toString() + " "
                    + response.reasonPhrase + " - " + jsonPayload.toString()
                };
                return authError;
            }
            EmailSignInResponse | error signupRes = EmailSignInResponse.constructFrom(jsonPayload);
            if (signupRes is EmailSignUpResponse) {
                return signupRes;
            } else {
                FirebaseAuthError authError = {
                    message: "Error occurred when parsing response to json.",
                    causes: signupRes
                };
                return authError;
            }
        } else {
            FirebaseAuthError authError = {
                message: "Error occurred when parsing response to json.",
                causes: jsonPayload
            };
            return authError;
        }

    } else {
        FirebaseAuthError authError = {
            message: response.reason(),
            causes: response
        };
        return authError;
    }
}
