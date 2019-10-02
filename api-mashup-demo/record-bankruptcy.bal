// A system module containing protocol access constructs
// Module objects referenced with 'http:' in code
import ballerina/http;
import ballerina/log;

@http:ServiceConfig {
   basePath: "/"
}
service hello on new http:Listener(9100) {

@http:ResourceConfig {
   methods: ["POST"],
   path: "/recordBankruptcyInfo"
}
    resource function recordBankruptcyInfo(http:Caller caller, http:Request request) {

        // Create object to carry data back to caller
        http:Response response = new;

        // Set a string payload to be sent to the caller
        // response.setTextPayload("Hello Ballerina!");
   json msg = {
         id: "101",
         status: "done",
         info: {
             name: "John Doe",
             city: "Colombo 03",
             country: "Sri Lanka"
         }
    };
        response.setJsonPayload(msg);

        // Send a response back to caller
        // Errors are ignored with '_'
        // -> indicates a synchronous network-bound call
        var result = caller->respond(response);

        if (result is error) {
            log:printError("Error sending response", result);
        }    }

}
