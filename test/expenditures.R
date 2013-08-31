library('RCurl')

test.expenditures <- function()
{
  # Check that we can skip the first n records

  param <- 'offset'
  value <- 5
  query <- data.frame( pars = param, vals = value )
  data <- queryTRACER(query)


