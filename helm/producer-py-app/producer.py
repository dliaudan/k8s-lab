from confluent_kafka import Producer
import time

conf = {'bootstrap.servers': "kafka-cluster-ip:9092"}

producer = Producer(conf)

def delivery_report(err, msg):
    if err is not None:
        print('Message delivery failed: {}'.format(err))
    else:
        print('Message delivered to {} [{}]'.format(msg.topic(), msg.partition()))

for i in range(10):
    producer.produce('test_topic', key=str(i), value='message-{}'.format(i), callback=delivery_report)
    producer.poll(0)
    time.sleep(1)

producer.flush()
#test