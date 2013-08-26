test.expenditures <- function()
{

# Check that we can skip the first n records

  n <- 5
  checkEquals(5, getExpenditures(
