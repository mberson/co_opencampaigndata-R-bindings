library('RUnit')

source('expenditures.R')

test.suite <- defineTestSuite("expenditures",
                              dirs = file.path("."),
                              testFileRegexp = '^\\w*\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
