
temp <- tempfile()

starTime <- Sys.time()

download.file("http://www.abc.ca.gov/datport/ABC_Data_Export.zip",temp)
con <- unz(temp, "m_tape460.LST")
data <-  read.fwf(con, fill = TRUE, comment.char = "", 
	widths = c(2,8,3,8,11,11,8,3,1,2,4,2,50,50,50,25,2,10,50,50,50,25,2,10,16,7))
unlink(temp)


names(data) <- c("License Type","File Number","License Or Application", "Type Status","Type Orig Issue Dates","Expiration Dates",
"Fee Codes","Duplicate Counts","Master Indicator", "Term in Months","Geo Code","District Office","Primary Name","Premise Street Address1",
"Premise Street Address2","Premise City","Premise State","Premise Zip","DBA name","Mail Street Address1","Mail Street Address2","Mail City","Mail State","Mail Zip","Premise County","Premise Census Tract")


# export the data to a text file that is tab separated

write.table(data, file = "~/ABC_Data_Export-Weekly-Export/ABCdata.txt", sep="\t", row.names = FALSE)

# get the time

endTime <- Sys.time()

difftime(endTime, starTime, units = c( "mins"))

