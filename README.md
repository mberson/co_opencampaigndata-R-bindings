# co_opencampaigndata-R-bindings

Have a look at https://github.com/samnsparky/co_opencampaigndata first.

This repository contains R bindings for the API, so you can get your political stats on!

## Getting Started

This package uses R data frames to represent API calls. Each row represents a parameter-value pair. For example:

 myFrame <- edit(data.frame())
 myFrame
  parameter value
1    offset     4
2 minAmount  2000
3 maxAmount  3000

myFrame now corresponds to the GET request:

co.opencampaigndata.org/expenditures?apikey=XXX?offset=4?minAmount=2000?maxAmount?3000
