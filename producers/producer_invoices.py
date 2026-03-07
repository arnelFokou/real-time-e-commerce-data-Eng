import json, random, time, uuid
from kafka import KafkaProducer
from datetime import datetime

# Configuration du producer
producer = KafkaProducer(
    bootstrap_servers='host.docker.internal:29092',
    value_serializer=lambda x: json.dumps(x).encode('utf-8')
)

products = [
    '3017620422003', '3270190022351', '3033490004758', 
    '3168930000000', '3560070725530', '3057640103522',
    '3228020010834', '3456789012345', '3560070996848', 
    '3017800010045', '3256220808001', '3560070995001'
]

def generate_invoice():
    num_items = random.randint(1, 4)
    items = []
    for _ in range(num_items):
        items.append({
            "product_ean": random.choice(products),
            "quantity": random.randint(1, 3)
        })
    
    return {
        "transaction_id": str(uuid.uuid4()),
        "timestamp": datetime.now().isoformat(),
        "items": items
    }

while True:
    invoice = generate_invoice()
    producer.send('invoices_raw', value=invoice)
    print(f"Facture envoyée : {invoice['transaction_id']}")
    time.sleep(3) # Attendre 3 secondes avant d'envoyer la prochaine facture