import ballerina/io;
import firebase_auth as auth;
import hirantha/firebase_core as core;

# Prints `Hello World`.

public function main() {

    var firebaseapp = new core:Firebase({
        apiKey: "AIzaSyBa_oB6xFmpAVyweiA-OBTUAFjR3NXgugI",
        authDomain: "asdasdas-ad79b.firebaseapp.com",
        databaseURL: "https://asdasdas-ad79b.firebaseio.com",
        projectId: "asdasdas-ad79b",
        storageBucket: "asdasdas-ad79b.appspot.com",
        messagingSenderId: "723208885826",
        appId: "1:723208885826:web:ac71d1e2254b85b30fffdb"
    });
    if (firebaseapp is error) {
        io:println(firebaseapp.reason());
    }
    if (firebaseapp is core:Firebase) {
        auth:FirebaseAuth auth = new (firebaseapp);
        var res = auth.signUpWithEmailAndPassword("sahanhirantha5@gmail.com", "123456S");
        io:println(res);
        io:println(firebaseapp.firebaseConfig);
    }

}
