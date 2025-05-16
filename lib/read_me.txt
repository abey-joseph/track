


we can update the checkbox as normal - it does need to wait to get updated in database then rebuild 
in case of an error of saving the data then only trigger rebuild  - because it may not happen very often - we can trigger the main instead 


add a feature that if the dateTime found a difference and the difference is negetive (means the last record date is higher than the current date) - either delete the data for the future dates or warn the user to check for date and re launch the app again


