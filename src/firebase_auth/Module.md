Connects to Firebase Auth from Ballerina. 

# Package Overview
The Firebase auth allows you to signup,signin,oauth users with Firebase.

## Compatibility
|                    |    Version     |  
|:------------------:|:--------------:|
| Ballerina Language |   1.0.0        |
| Firebase_auth      |   v1           |

## Sample

Import the `hirantha/firebase_auth` package into the Ballerina project.

```ballerina
import hirantha/firebase_auth as auth;
```

The Firebase auth has to be instantiated Firebase app which comes with `hirantha/firebase_core`.

**Obtaining project configuration json**

1. Sign in to https://console.firebase.google.com/.
2. Click **Add Project** and necessary information about the project.
3. Agree to the terms and click **Create Project**.
4. After creating the project, click **Add Firebase to your web app**.
5. In the dialog you can find the **json**.

You can now enter the json in the Firebase app config:
```ballerina
var firebaseapp = new firebase_core:Firebase({
    apiKey: "<your-api-key>",
    authDomain: "<your-auth-domain>",
    databaseURL: "<your-database-url>",
    projectId: "<your-cloud-firestore-project>",
    storageBucket: "<your-storage-bucket>",
    messagingSenderId: "<your-sender-id>",
    appId: "<your-app-id>"
});

if (firebaseapp is firebase_core:Firebase) {
        auth:FirebaseAuth auth = new (firebaseapp);
        var res = auth.signUpWithEmailAndPassword("example@email.com", "123456");
        io:println(res);
}

if (firebaseapp is firebase_core:Firebase) {
        auth:FirebaseAuth auth = new (firebaseapp);
        var res = auth.signInWithEmailAndPassword("example@email.com", "123456");
        io:println(res);
}
```