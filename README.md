# R-Shiny
app.R file is a basic shiny application, that takes a .csv file as input and tow arguments as no of traits and score value from user.
This app is best used on STR traits genotyping data of many samples.


example .CSV file 
SampleID,Fore Udder Attachment,Rear Udder width,Rear Udder Height,Udder Support,Udder Depth,Udder Balance,Teat Length,Teat Thickness,Teat placement
200,3,3,4,3,4,3,7,8,4
300,4,4,5,5,5,3,4,5,6
..
..
..
..
..
..

It looks out for user specified score value in all the traits and than how many traits fulfill this score threshold from 
user and than prints only those Sample IDs.
