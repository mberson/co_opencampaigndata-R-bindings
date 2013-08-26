# As of 2013-08-18, the API is not available over HTTP, so we must inject that dependency
# into the test suite. Every identifier beginning with "FAKE" injects a dependency, and must be
# replaced before these bindings can be published as a package.

# Instead of fetching real data from the TRACER database, we'll simply store a blob in the test suite
# for now.
FAKE_db <- 1:500

# The API accepts requests to skip the first OFFSET records
FAKE_getByOffset <- function (offset) {
  FAKE_db[offset:500]
}
