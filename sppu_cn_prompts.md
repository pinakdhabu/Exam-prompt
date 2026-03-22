# SPPU Computer Networks Optimized Prompts
## Based on 2019 Pattern Syllabus (Subject: 310244)

### 2 Mark Questions

**Define Computer Network [2 marks]**
Time Budget (2 min):
  Definition/Intro   ~1.5 min
  Conclusion         ~0.5 min

A **Computer Network** is a set of interconnected devices that communicate using standardized protocols to share resources and exchange data.
It enables resource sharing, communication, and distributed processing across geographical locations.

**Explain OSI Model layers [2 marks]**
Time Budget (2 min):
  Definition/Intro   ~1 min
  Main points        ~0.5 min
  Conclusion         ~0.5 min

The **OSI (Open Systems Interconnection) Model** is a conceptual framework that standardizes network functions into seven layers.
Each layer performs specific services for the layer above and below it.

[Physical]: Transmits raw bit stream over physical medium.
[Data Link]: Provides node-to-point transfer and error detection.
[Network]: Handles logical addressing and routing.
[Transport]: Ensures end-to-end data transfer and reliability.
[Session]: Manages dialogues between applications.
[Presentation]: Translates, encrypts, and compresses data.
[Application]: Provides network services to end-user applications.

Thus, OSI model provides a universal standard for network interoperability.
Hence it is widely used as a reference model in network design and troubleshooting.
================================================================
MARKING SCHEME  Q.No.                         [2 Marks]
  Definition / Introduction      : 0.5 mark
  Main Points (3 x 0.5 mark each): 1.5 marks
  Conclusion                     : 0 mark
                                    -------
  Total                          : 2 marks
================================================================

**Explain TCP/IP Model with diagram [4 marks]**
Time Budget (4 min):
  Definition/Intro   ~0.5 min
  Diagram            ~1.5 min
  Main points        ~1 min
  Conclusion         ~0.5 min

The **TCP/IP Model** is a practical networking model consisting of four layers that define how data is transmitted over networks.
It is the foundation of the internet and most modern networks.

[Network Interface]: Combines Physical and Data Link layers of OSI.
[Internet]: Handles IP addressing, routing, and fragmentation (corresponds to OSI Network layer).
[Transport]: Provides end-to-end communication using TCP/UDP (corresponds to OSI Transport layer).
[Application]: Combines Session, Presentation, and Application layers of OSI.

Thus, TCP/IP model provides a robust framework for internet communication.
Hence it is the de facto standard for global networking.
================================================================
MARKING SCHEME  Q.No.                         [4 Marks]
  Definition / Introduction      : 0.5 mark
  Diagram (with labels)          : 1 mark
  Main Points (3 x 0.5 mark each): 1.5 marks
  Conclusion                     : 0.5 mark
                                    -------
  Total                          : 4 marks
================================================================

**Explain Sliding Window Protocol [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~0.5 min
  Main points        ~3 min
  Example            ~1.5 min
  Conclusion         ~0.5 min

**Sliding Window Protocol** is a data link layer protocol that enables reliable, sequential delivery of frames while allowing multiple frames to be in transit simultaneously.
It improves link utilization compared to stop-and-wait protocols.

**[Sender Window]**: Range of sequence numbers for frames that can be sent without acknowledgment.
**[Receiver Window]**: Range of sequence numbers the receiver is prepared to accept.
**[Acknowledgment]**: Cumulative or selective ACKs indicating successfully received frames.
**[Timeout and Retransmission]**: Mechanism to resend frames if ACK not received within timeout period.

Example: With window size 4, sender can transmit frames 0,1,2,3 before waiting for ACKs. Upon receiving ACK for frame 0, window slides to allow frame 4 to be sent.

Thus, Sliding Window Protocol improves throughput by allowing multiple frames in transit.
Hence it is used in data link protocols like HDLC and in TCP's congestion control.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (3 x 1 mark each)  : 3 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================

**Compare TCP and UDP [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~0.5 min
  Main points        ~3 min
  Conclusion         ~1.5 min

**TCP (Transmission Control Protocol)** and **UDP (User Datagram Protocol)** differ in the following ways:

| TCP                            | UDP                              |
|--------------------------------|----------------------------------|
| Connection-oriented protocol   | Connectionless protocol          |
| Reliable data delivery         | Unreliable, best-effort delivery |
| Ordered packet delivery        | No guarantee of packet ordering  |
| Flow and congestion control    | No flow or congestion control    |
| Higher overhead due to acknowledgments | Lower overhead, minimal header |

Thus, TCP is suitable for applications requiring reliability (e.g., HTTP, FTP) while UDP is preferred for real-time applications (e.g., video streaming, VoIP).
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 0.5 mark
  Main Points (5 x 1 mark each)  : 5 marks
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================