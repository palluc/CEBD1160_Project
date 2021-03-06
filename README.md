<H3>CEBD1160_Project Fall 2017: Submitted by Luciana<H3>
<H3>Project repository for CEBD1160 class</H3>


<H3>Overview of Dataset</H3>

<p>The Excel file is named "Nutrition_Physical_Activity_and_Obesity_Behavioral_Risk_Factor_Surveillance_System.csv", and contains data on three different topics in column "Topic" and column "Class":
<ol>
 <li>Fruits and Vegetables - Behavior</li>
    <ul><li>Percent of adults who report consuming fruit less than one time daily</li></ul>
    <ul><li>Percent of adults who report consuming vegetables less than one time daily</li></ul>

 <li>Obesity / Weight Status</li>
    <ul><li>Percent of adults aged 18 years and older who have obesity</li></ul>
    <ul><li>Percent of adults aged 18 years and older who have an overweight classification</li></ul>

 <li>Physical Activity - Behavior</li>

    <ul><li>Percent of adults who achieve at least 150 minutes a week of moderate-intensity aerobic physical activity or 75 minutes a week of vigorous-intensity aerobic activity (or an equivalent combination)</li></ul>
    <ul><li>Percent of adults who achieve at least 150 minutes a week of moderate-intensity aerobic physical activity or 75 minutes a week of vigorous-intensity aerobic physical activity and engage in muscle-strengthening activities on 2 or more days a week</li></ul>
    <ul><li>Percent of adults who achieve at least 300 minutes a week of moderate-intensity aerobic physical activity or 150 minutes a week of vigorous-intensity aerobic activity (or an equivalent combination)</li></ul>
    <ul><li>Percent of adults who engage in muscle-strengthening activities on 2 or more days a week</li></ul>
    <ul><li>Percent of adults who engage in no leisure-time physical activity</li></ul>
</ol>
</p>

<p>
Within each of these topics the analysis variable, the percentage value of a question, is further stratefied into categories (column = "StratificationCategory1") in each topic category
<ol>
 <li>Age (years)</li>
 <li>Education</li>
 <li>Gender</li>
 <li>Income</li>
 <li>Race/Ethnicity</li>
 <li>Total</li>
</ol>
</p>

<hr>


<H3>Analysis Variables Selected for Purpose of Plotting Graphs</H3>
<p>
<ol>
<li># Plot graph #1 with the frequency distribution histogram of Percent of adults aged 18 years and older who have obesity/overweight classification for Year=2015</li>
<li># Plot graph #2 with the average distribution histogram of Average Percentage Weight Status in Adults per Year</li>
<li># Plot graph #3 with the two variables (Year vs Value) for New England States</li>
</ol>

</p>

<p>
Note: 
The discriptive statistics of the graph #1: the variables 'Percent of adults aged 18 years and older who have obesity' and 'Percent of adults aged 18 years and older who have an overweight classification' was done on the frequency count on the rounded data/percentage value (Data_Value column).
<br><br>
The discriptive statistics of the graph #2: years 2011 to 2015 of the variable value 'Percent of adults aged 18 years and older who have obesity' was done on the average data value (Data_Value column).
<br><br>
The graph #3: years 2011 to 2015  vs 'Percent of adults aged 18 years and older who have obesity' and 'Percent of adults aged 18 years and older who have an overweight classification' were plotted for only the six New England states (CT,ME,MA,NH,RI,VT) so that the graph was more clear. 
</p>
<hr>

<H3>Graphs in Gnuplot</H3>

<p>To prepare the data for gnuplot, Linux bash commands were used, so that the data may be selected and filtered for the datarecords of interest and only analysis variables within the Excel dataset were kept.
</p>

<p>
The GREP command was used to search for lines that had the topic " ", and pipe those lines to an intermediary output file.
</p>
<p>
Afterwards, the AWK command was used to search for a pattern with a particular field/column.
</p>

<p>
Lastly, the CUT command keeps only the fields needed for mapping to  graph x-axis and y-axis variables
</p>


<H5>Steps for running gnuplot program</H5>

<p>
To run the Gnuplot plot scripts:
<li>Start a Docker, with a container in Ubuntu image</li>
<li>From GITHUB, clone the repository "CEBD1160_Project", URL: https://github.com/palluc/CEBD1160_Project</li>
<li>Start and attach a container</li>
<li>change directory to 'CEBD1160_Project/Data'</li>
<li>Run bash script gnuplot_datasets_prepare.sh</li>
<li>change directory to 'CEBD1160_Project/gnuplot'</li>
<li>Run the gnuplot programs: graph1.gnu, graph2.gnu, graph3.gnu from gnuplot command line</li>
</p>


<p>
The output graphs are stored in same subfolder 'gnuplot'. To see the graphs on the PC, use docker copy command. Therefore, exit gnuplot, and exit docker container.
</p>


<p>
Use command :
docker cp <i>cca404caa4fd</i>:/CEBD1160_Project/gnuplot/graph1.png <i>C:/Users/Luciana/CEBD1160/CEBD1160_Project/gnuplot/</i>graph1.png
</p>

<hr>

<H3>Graphs in R</H3>
<p>
Program name: r_graph_plot.r
</p>

<p>
Output files: r_graph1.png, r_graph2.png, r_graph3.png
</p>

<H5>Steps for running R program in RStudio</H5>

<p>
Note: The R program was run from RStudion on client, and not from webrowser using localhost, as was done in class.
</p>

<p>
To run the R program, from RStudio:
<li>Click on the menu: File -> New -> R Script </li>
<li>Paste the code in the new source code area  </li>
<li>Click the "Source" button above the code area </li>
</p>
