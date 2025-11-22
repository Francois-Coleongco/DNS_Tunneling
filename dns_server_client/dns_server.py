import socket
from datetime import datetime, timezone

from dnslib import QTYPE, RR, A, DNSHeader, DNSRecord

LISTEN_IP = "0.0.0.0"
LISTEN_PORT = 6969


def main():
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.bind((LISTEN_IP, LISTEN_PORT))

        print(f"[+] DNS server listening on {LISTEN_IP}:{LISTEN_PORT}")

        while True:
            data, addr = sock.recvfrom(1024)
            req = DNSRecord.parse(data)

            qname = str(req.q.qname)
            timestamp = datetime.now().astimezone(timezone.utc).isoformat()
            print(f"[{timestamp}] Query from {addr[0]}: {qname}")

            reply = DNSRecord(DNSHeader(id=req.header.id), q=req.q)
            reply = req.reply()

            reply.add_answer(RR(qname, QTYPE.A, rdata=A("127.0.0.1"), ttl=60))

            sock.sendto(reply.pack(), addr)
    except Exception as e:
        print(f"error occurred in main: {e}")


if __name__ == "__main__":
    main()
