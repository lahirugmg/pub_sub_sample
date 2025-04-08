import ballerina/http;
import ballerinax/rabbitmq;

service / on new http:Listener(8080) {
    resource function post message(@http:Payload QueueMessage message) returns string|error {
        rabbitmq:AnydataMessage messageContent = {
            content: message.content,
            routingKey: rabbitQueueName
        };

        check rabbitmqClient->queueDeclare(rabbitQueueName);
        check rabbitmqClient->publishMessage(messageContent);
        
        return "Message stored successfully";
    }
}