// A system module containing protocol access constructs
// Module objects referenced with 'http:' in code
import ballerina/http;

@http:ServiceConfig {
   basePath: "/"
}
service hello on new http:Listener(9102) {

@http:ResourceConfig {
   methods: ["POST"],
   path: "/createCall"
}
    resource function createCall(http:Caller caller, http:Request request) {

        // Create object to carry data back to caller
        http:Response response = new;

        // Set a string payload to be sent to the caller
        // response.setTextPayload("Hello Ballerina!");
   json msg = {
         id: "200",
         status: "created"
    };
        response.setJsonPayload(msg);

        // Send a response back to caller
        // Errors are ignored with '_'
        // -> indicates a synchronous network-bound call
        _ = caller -> respond(response);
    }

}
