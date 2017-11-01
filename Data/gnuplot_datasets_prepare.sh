# Prepare dataset for gnuplot Graph #1
# ====================================

# Filter data for Class (column F) = "Obesity / Weight Status"
grep -iw 'Obesity / Weight Status' Nutrition_Physical_Activity_and_Obesity_Behavioral_Risk_Factor_Surveillance_System.csv > topic_obesity_data.csv 

# Select rows that have StratificationCategory = 'Total' and YearStart = '2015'
awk  -F "," -v OFS=',' '{ if(($1 == "2015") && ($18 == "Total")) { print $0 }}'  topic_obesity_data.csv > topic_obesity_2015_overall_data.csv

# Extract columns of data so that it is ready for plot
# Columns 1:YearStart	2:YearEnd	3:LocationAbbr	4:LocationDesc  8:Question 10: Data_Value_Type  11:Data_Value_Type
cut -d ',' -f 1,2,3,4,8,10,11  topic_obesity_2015_overall_data.csv > obesity_overall.csv


# Prepare dataset for gnuplot Graph #2
# ====================================

# Filter data for Class (column F) = "Obesity / Weight Status"
# grep bash utility
grep -iw 'Obesity / Weight Status' Nutrition_Physical_Activity_and_Obesity_Behavioral_Risk_Factor_Surveillance_System.csv > topic_obesity_data.csv 

# Select rows that have StratificationCategory = 'Total' and Question = 'Percent of adults aged 18 years and older who have obesity'
# awk bash utility
awk  -F "," -v OFS=',' '{ if(($8 == "Percent of adults aged 18 years and older who have obesity") && ($18 == "Total")) { print $0 }}' topic_obesity_data.csv > topic_obesity_overall_data.csv

# Extract columns of data so that it is ready for plot: 
# Columns 1:YearStart	2:YearEnd	3:LocationAbbr	4:LocationDesc  8:Question 10: Data_Value_Type  11:Data_Value_Type
cut -d ',' -f 1,2,3,4,8,10,11  topic_obesity_overall_data.csv > obesity_allyears_overall.csv


# Prepare dataset for gnuplot Graph #3
# ====================================

# Filter data for Class (column F) = "Obesity / Weight Status"
#
grep -iw 'Obesity / Weight Status' Nutrition_Physical_Activity_and_Obesity_Behavioral_Risk_Factor_Surveillance_System.csv > topic_obesity_data.csv 

# Select rows that have StratificationCategory = 'Total' and Location Abbreviation = CT, ME, MA, NH, RI, VT
#
awk  -F "," -v OFS=',' '{ if(($3 == "CT" || $3 == "ME" || $3 == "MA" || $3 == "NH" || $3 == "RI" || $3 == "VT") && ($18 == "Total")) { print $0 }}'  topic_obesity_data.csv > newengland_obesity_overall_data.csv

# Extract columns of data so that it is ready for plot
# Columns 1:YearStart	2:YearEnd	3:LocationAbbr	4:LocationDesc  8:Question 10: Data_Value_Type  11:Data_Value_Type
cut -d ',' -f 1,2,3,4,8,10,11  newengland_obesity_overall_data.csv > newengland_overall.csv


cp obesity_overall.csv ../gnuplot/obesity_overall.csv
cp obesity_overall.csv ../gnuplot/obesity_allyears_overall.csv
cp obesity_overall.csv ../gnuplot/newengland_overall.csv

