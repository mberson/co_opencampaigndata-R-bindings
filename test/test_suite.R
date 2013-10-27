library ( 'RCurl' )
library ( 'rjson' )

# Don't store the API key publicly
apiKey <- readline ( 'Please enter your API key: ' )

# The available parameters for each of the request types
expenditure_params <- c ( "offset", "limit", "commiteeID", "minAmount",
                          "maxAmount", "startDate", "endDate", "lastName",
                          "firstName", "middleInitial", "address", "city",
                          "state", "zip", "recordID", "startFiledDate",
                          "endFiledDate", "expenditureType", "paymentType",
                          "disbursementType", "electioneering",
                          "committeeType", "committeeName", "candidateName",
                          "employer", "occupation", "amended", "amendment",
                          "amendendRecordID", "jurisdiction", "fields" 
                        )

contribution_params <- c ( "limit", "offset", "committeeID", "minAmount",
                           "maxAmount", "startDate", "endDate", "lastName",
                           "firstName", "middleInitial", "address", "city",
                           "state", "zip", "recordID", "startFiledDate",
                           "endFiledDate", "contributionType", "receiptType",
                           "contributorType", "electioneering",
                           "committeeType", "committeeName", "candidateName",
                           "employer", "occupation", "amended", "amendment",
                           "amendedRecordID", "jurisdiction", "fields"
                         )

loan_params <- c ( "limit", "offset", "commiteeID", "minPaymentAmount",
                   "maxPaymentAmount", "startDate", "endDate", "name", 
                   "address", "city", "state:2", "zip:5", "recordID", 
                   "startFiledDate", "endFiledDate", "loanType",
                   "loanSourceType", "minLoanAmount", "maxLoanAmount", 
                   "minLoanStartDate", "maxLoanStartDate", "committeeType", 
                   "committeeName", "minInterestRate", "amended", "amendment", 
                   "amendedRecordID", "jurisdiction", "loanBalance", "fields"
                 )

# A master reference of paramaters
params <- list ( contributions = contributions_params ,
                 expenditures = expenditure_params ,
                 loans = loan_params
               )

build_URL <- function ( q_list, type ) {
	url	<- paste ( 'http://co.opencampaigndata.org/' , type ,
	               '?apiKey=' , apiKey ,
	               sep="" , collapse=""
			 	 )
	for ( q_param in params[[type]] ) {
		q_value <- q_list[[q_param]]
		if ( !is.null(q_value) ) {
			url <- paste ( url , "&" ,
			               q_param , "=" , q_value ,
			               sep="" , collapse=""
			             )
		}
	}
	return ( url )
}

get_query <- function ( q_list, type ) {
	loop_over_pages <- function ( url ) {
		page <- fromJSON( getURL( url ) )
		next_href <- page$meta$`next-href`
		if ( is.null( next_href ) ) {
			return ( page$expenditures )
		} else {
			return ( append ( page$expenditures , loop_over_pages( next_href ) ) )
		}
	}
	url <- build_URL ( q_list, type )
	sloppy_data <- loop_over_pages ( url )
	neat_data <- transpose_columns ( sloppy_data )
	return ( data.frame( neat_data ) )
}


get_contributions <- function ( q_list ) {
	return ( get_query ( q_list, "contributions" ) )
}

get_expenditures <- function ( q_list ) {
	return ( get_query ( q_list, "expenditures" ) )
}

get_loans <- function ( q_list ) {
	return ( get_query ( q_list, "loans" ) )
}

transpose_to_columns <- function ( q_list ) {
	query <- get_query_all_pages ( q_list )
	loop_over_rows <- function ( row ) {
		if ( row == 0 ) {
			return ( NULL )
		} else {
			return ( rbind ( query[[row]], loop_over_rows ( row - 1 ) ) )
		}
	}
	return ( loop_over_rows( length( query ) ) )
}

