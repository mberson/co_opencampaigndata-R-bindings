# co_opencampaigndata-R-bindings

Have a look at https://github.com/samnsparky/co_opencampaigndata first.

This repository contains R bindings for the API, so you can get your political stats on!

## Getting Started

The API provides three kinds of requests: contributions, expenditures and loans. Oddly, this package provides three functions: `get_contributions`, `get_expenditures` and `get_loans`. The user is expected to provide to each of these functions an R list wherein the values are named after the parameters to the API call. For example:

```
> contribution_req <- list ( apiKey = "XXXXXX" ,
                             zip    = "80211" ,
                             minAmount = "600" ,
                             maxAmount = "601"
                           )
> get_contributions ( contributions_req )
$contributions
$contributions[[1]]
$contributions[[1]]$recordID
[1] "1368644"

$contributions[[1]]$commiteeID
[1] "19991200038"

$contributions[[1]]$amount
[1] 600

$contributions[[1]]$firstName
[1] ""

$contributions[[1]]$lastName
[1] "DENVER YOUNG ARTISTS ORCHESTRA"

...
```
