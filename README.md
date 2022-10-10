# failover

Simple on-premise load balancing using HAProxy to simulate failover from cloud to an on-prem server in the event of a network or remote system failure.

Setup:
* Setup a Linux instance, preferably with a static or reserved IP.
* For simplicity's sake, disable SELinux and the firewall.  (not recommended in any real environment)
* Install HAProxy
* Create a DNS entry for it called my.edge.test and point it to this instance.  (Or name the machine that)
* Test that everything is setup correctly with the following:
 - ping my.edge.test (should resolve to the Linux instance)
 - ping online.my.edge.test (same)
 - ping offline.my.edge.test (same)
