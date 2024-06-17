from confluent_kafka import Consumer, KafkaError

conf = {
    'bootstrap.servers': "kafka-cluster-ip:9092",
    'group.id': "my_group",
    'auto.offset.reset': 'earliest'
}

consumer = Consumer(conf)
consumer.subscribe(['test_topic'])

while True:
    msg = consumer.poll(1.0)
    if msg is None:
        continue
    if msg.error():
        if msg.error().code() == KafkaError._PARTITION_EOF:
            continue
        else:
            print(msg.error())
            break

    print('Received message: {}'.format(msg.value().decode('utf-8')))

consumer.close()
