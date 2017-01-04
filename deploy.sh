#This architecture has the following details:
#Controller node
#NIC1- management
#NIC2- external
#NIC3- tenant

#Compute node
#NIC1- management
#NIC2- tenant
#Want tenant traffic to be on its own interface br-vlan on NIC2

openstack overcloud deploy --templates -e /home/stack/templates/advanced-networking.yaml   --compute-flavor compute --control-flavor control --compute-scale 1 --control-scale 1 --ceph-storage-scale 0 --neutron-network-type vxlan --neutron-tunnel-types vxlan --ntp-server pool.ntp.org --neutron-bridge-mappings datacentre:br-ex,tenant:br-vlan --neutron-network-vlan-ranges tenant:30:100
