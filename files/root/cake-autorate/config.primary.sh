#!/usr/bin/env bash

# *** INSTANCE-SPECIFIC CONFIGURATION OPTIONS ***
# 
# cake-autorate will run one instance per config file present in the /root/cake-autorate
# directory in the form: config.instance.sh. Thus multiple instances of cake-autorate
# can be established by setting up appropriate config files like config.primary.sh and 
# config.secondary.sh for the respective first and second instances of cake-autorate.

### For multihomed setups, it is the responsibility of the user to ensure that the probes
### sent by this instance of cake-autorate actually travel through these interfaces.
### See ping_extra_args and ping_prefix_string

dl_if=ifb4lan2 # download interface
ul_if=lan2     # upload interface

# Set either of the below to 0 to adjust one direction only
# or alternatively set both to 0 to simply use cake-autorate to monitor a connection
adjust_dl_shaper_rate=1 # enable (1) or disable (0) actually changing the dl shaper rate
adjust_ul_shaper_rate=1 # enable (1) or disable (0) actually changing the ul shaper rate

min_dl_shaper_rate_kbps=25000  # minimum bandwidth for download (Kbit/s)
base_dl_shaper_rate_kbps=80000 # steady state bandwidth for download (Kbit/s)
max_dl_shaper_rate_kbps=150000  # maximum bandwidth for download (Kbit/s)

min_ul_shaper_rate_kbps=10000  # minimum bandwidth for upload (Kbit/s)
base_ul_shaper_rate_kbps=12000 # steady state bandwidth for upload (KBit/s)
max_ul_shaper_rate_kbps=20000  # maximum bandwidth for upload (Kbit/s)

connection_active_thr_kbps=2000  # threshold in Kbit/s below which dl/ul is considered idle

# *** OVERRIDES ***

### See defaults.sh for additional configuration options
### that can be set in this configuration file to override the defaults.
### Place any such overrides below this line.

output_processing_stats=0 	# enable (1) or disable (0) output monitoring lines showing processing stats
output_load_stats=0       	# enable (1) or disable (0) output monitoring lines showing achieved loads
output_reflector_stats=0  	# enable (1) or disable (0) output monitoring lines showing reflector stats
output_summary_stats=0          # enable (1) or disable (0) output monitoring lines showing summary stats
output_cake_changes=0     	# enable (1) or disable (0) output monitoring lines showing cake bandwidth changes
debug=0 		  	# enable (1) or disable (0) out of debug lines

# This can generate a LOT of records so be careful:
log_DEBUG_messages_to_syslog=0	# enable (1) or disable (0) logging of all DEBUG records into the system log.

# ** Take care with these settings to ensure you won't run into OOM issues on your router ***
# every write the cumulative write time and bytes associated with each log line are checked
# and if either exceeds the configured values below, the log file is rotated
log_to_file=0              # enable (1) or disable (0) output logging to file (/tmp/cake-autorate.log)


# owd delta threshold in ms is the extent of OWD increase to classify as a delay
# these are automatically adjusted based on maximum on the wire packet size
# (adjustment significant at sub 12Mbit/s rates, else negligible)
dl_owd_delta_thr_ms=40.0 # (milliseconds)
ul_owd_delta_thr_ms=40.0 # (milliseconds)

# average owd delta threshold in ms at which maximum adjust_down_bufferbloat is applied
dl_avg_owd_delta_thr_ms=80.0 # (milliseconds)
ul_avg_owd_delta_thr_ms=80.0 # (milliseconds)

