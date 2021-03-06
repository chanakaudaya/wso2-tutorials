## Sample files to create an API mashup with WSO2 API Manager

### Use case diagram
![API Mashup with WSO2 API Manager](WSO2_APIM_Service_Mashup.png?raw=true)

### Prerequisites
* Install Ballerina by visiting the official Ballerina website
https://ballerina.io/downloads/

### Starting off 3 services
* ballerina run "bal-file-name"

### Testing out ballerina services with CURL
* curl -X POST -d "Test" localhost:9100/recordBankruptcyInfo

* curl -X POST -d "Test" localhost:9101/addMemo

* curl -X POST -d "Test" localhost:9102/createCall

### Testing out the created API
* curl -v -k -X POST "https://172.19.0.1:8243/mashupdemo/v1/" -H "accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer XXXXXXXXXXXXX" -d "{ \"payload\": \"string\"}"

### Sample response
* {"results": ["result1":{"id":101,"status":"done","info":{"name":"John Doe","city":"Colombo 03","country":"Sri Lanka"}}, "result2":"Memo Added!", "result3":{"id":200,"status":"created"}]}
