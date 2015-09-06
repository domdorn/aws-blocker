# Block / Handle unwanted IP-Traffic

This repository holds a set of scripts you can use to handle unwanted IP-Traffic / traffic from unwanted IP-Ranges.

Its intended to be used together with ipset, but you can also change it to work with any network-filter that supports ip-ranges. 


# AWS Blocker

This simple bash script will retrieve the official list of AWS IP ranges, then add them to a ipset.

The script is safe to run multiple times. The AWS IP range list is updated periodically, so you may want to run this script as a cron.
Required: curl + jq
Arguments: does not take arguments

# Hetzner Blocker
Will generate a list of Hetzner IP-Blocks based on their BGP-Pairings. 

# Hosteurope Blocker
Will generate a list of Hosteurope IP-Blocks based on their BGP-Pairings.

# Countries
Will generate several lists with IP-Ranges for all the countries in the world. 
These lists will be joined to continent based lists. 
You can then use that to create fine grained allow/deny settings.



