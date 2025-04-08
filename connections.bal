import ballerinax/rabbitmq;

final rabbitmq:Client rabbitmqClient = check new(
    host = rabbitHost,
    port = rabbitPort
);