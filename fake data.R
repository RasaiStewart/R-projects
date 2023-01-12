# Create fake data

NumberOfQ <- 1000 # Number of quotes required
SampleStartDate <- Sys.Date()+1
SampleEndDate <- SampleStartDate+100
dapsdate <- sample(seq(as.Date(SampleStartDate), as.Date(SampleEndDate),
                       by="day"), NumberOfQ) # Departure Date
dapedate <- dapsdate+sample(1:50,NumberOfQ, replace = TRUE)
# Departure Date + Duration
DepartureDate <- format(dapsdate, format="%d/%m/%Y")
ReturnDate <- format(dapedate, format="%d/%m/%Y")
ERVWebPrim <-cbind.data.frame(DepartureDate, ReturnDate, stringsAsFactors
                              =FALSE)
ERVWebPrim$Destination <- sample(c("Destination_7","Destination_9", "
Destination_2", "Destination_10", "Destination_17"), NumberOfQ,
                                 replace = TRUE) # Europe1,2 - 2/10, WX- 7, W - 9, A/N - 17
ERVWebPrim$TravellerType <-"TravellerType_1"
# Individual 1, 2 Couple, 3 Family, 4 Single Parent
TripType <- "TripType_1" # Single 1, "TripType_2" for Annual
# Number of Passegners 1
# Number of Children 0
ERVWebPrim$PassAge1 <- sample(18:75,NumberOfQ, replace = TRUE)
# Age of Passenge