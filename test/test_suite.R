library ( 'RCurl' )
library ( 'rjson' )

# Don't store the API publicly

apiKey <- readline ( 'Please enter your API key: ' )

# A query with no parameters. This will basically check that R is communicating
# well with the API endpoint.

get_expenditures_no_params <- function () {
	query	<- paste ( 'http://co.opencampaigndata.org/expenditures?apiKey=' ,
	                   apiKey ,
	                   sep="" ,
	                   collapse=""
	                 )
	json	<- getURL ( query )
	r_data	<- fromJSON ( json )
	return ( r_data )
}

# Exhaustively represent an expenditures query

expenditures_query <- list (
	offset				= '5' ,
	limit				=   ,
	commiteeID			=   ,
	minAmount			=   ,
	maxAmount			=   ,
	startDate			=   ,
	endDate				=   ,
	lastName			=   ,
	firstName			=   ,
	middleInitial		=   ,
	address				=   ,
	city				=   ,
	state				=   ,
	zip					=   ,
	recordID			=   ,
	startFiledDate		=   ,
	endFiledDate		=   ,
	expenditureType		=   ,
	paymentType			=   ,
	disbursementType	=   ,
	electioneering		=   ,
	committeeType		=   ,
	committeeName		=   ,
	candidateName		=   ,
	employer			=   ,
	occupation			=   ,
	amended				=   ,
	amendment			=   ,
	amendedRecordID		=   ,
	jurisdiction		=   ,
	fields				=   
}

# Test everything
run_tests <- function () {
	get_expenditures_no_params()
}
