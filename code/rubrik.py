#!/usr/bin/python
# -*- coding: utf-8 -*-

import rubrik_cdm
import urllib3
urllib3.disable_warnings()
import sys  

reload(sys)  
sys.setdefaultencoding('utf8')

node_ip = "54.171.113.131"
username  = "ed"
password = "LPBNWZi9e/K{5sW/{^[}"

rubrik = rubrik_cdm.Connect(node_ip,username,password)
print("Logged in successfully")

# Check cluster version
cluster_version = rubrik.cluster_version()
print(cluster_version)

# Add two servers to backup
db = "34.250.118.155"
web = "34.253.157.82"
print("Adding servers to Rubrik cluster")
add_host = rubrik.add_physical_host(db)
add_host = rubrik.add_physical_host(web)

# Creating Fileset
fileset_name = "UK-VMUG"
operating_system = 'Linux'
include = ['/home', '/etc', '*.pdf']
exclude = ['/user/local/temp', '*.mov', '*.mp3']
exclude_exception = ['/company/*.mp4']
print("Creating fileset UK-VMUG")
new_fileset = rubrik.create_physical_fileset(fileset_name, operating_system, include, exclude, exclude_exception)

# Assign Fileset and SLA to servers
sla = 'Gold'
print("Assinging Fileset and SLA")
assign_fileset = rubrik.assign_physical_host_fileset(db, fileset_name, operating_system, sla)
assign_fileset = rubrik.assign_physical_host_fileset(web, fileset_name, operating_system, sla)

# Take on-demand backup
object_type = "physical_host"
snapshot = rubrik.on_demand_snapshot(db, object_type, sla, fileset_name, operating_system)
snapshot = rubrik.on_demand_snapshot(web, object_type, sla, fileset_name, operating_system)

print("Done!")