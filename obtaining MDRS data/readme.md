### Contents of this folder

You will find my code used to obtain crew reports from the MDRS website[ MDRS website](http://mdrs.marssociety.org/)   . Note: use good scraping practices and contact the MDRS administration first. I got their explicit permission to obtain and use these data. Jupyter notebooks in this repository contain code for obtaining:
1. Biographic data of crew members (crew number, name, gender, role in a crew, short biography). 
 2. Crew daily reports. 


#### Main Python packages: 
- [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#)
- [Pandas](https://pandas.pydata.org/)
- [requests](https://pypi.org/project/requests/2.7.0/)

## **Crew biographies**

For crews 182-223 (MDRS season 17-19): [get_bios_s17-19.ipynb](get_bios_s17-19.ipynb). This code uses function from  [fun_person_bio.ipynb](fun_person_bio.ipynb); keep these files in the same directory. Output is crews182-223.csv files in the same directory. Note that this approach yields a lot of missing datal. The rest of crew biographic data were entered manually, hence are not part of this repository. 


 
### **Suplemental data/materials** 
 [crew_dates.csv](data/crew_dates.csv). This was used to connect reports with their authors' biographical data. The file structure is the following:

Crew|Season|Year|Start|Finish|
--|--|--|--|-- |

<br></br>

# Crew Reports 

Years |Season | Crews | Code |Output| Len(Output) | Author info | Notes |
--| --| --|--|--|--|-- | --|
2002-2010 |1-9 |1-94|[s1-9_get_reports.ipynb](code/s1-9_get_reports.ipynb)|s1-9_reports.csv|8793| No | I used archival data that James Burk shared with me in a .zip file. All these reports are also available online, but this code will not work. |
2010-2011| 10 | 96-104 | [s10_get_reports.ipynb](code/s10_get_reports.ipynb)|s10_reports.csv|821 | No | No date for reports; simulation day instead. 
2011-2012 |11 |108-118 |[s11_get_reports.ipynb](code/s11_get_reports.ipynb)|s11_reports.csv | 225 |No | No date for reports; simulation day instead. 
2012-2013 |12 |119-130 |[s12_get_reports.ipynb](code/s12_get_reports.ipynb)|s12_reports.csv|608|No|
2013-2014 |13 |131-141 |[s13_get_reports.ipynb](code/s13_get_reports.ipynb)|s13_reports.csv|621|No|
2014-2016 |14-15 |142-169|[s14-15_get_reports.ipynb](code/s14-15_get_reports.ipynb) |s14-15_reports.csv|1422 |No| Two seasons at once because reports are in one place. 
2016-2017 |16 |171-181| [s16_get_reports.ipynb](code/s16_get_reports.ipynb)|s16_reports.csv| 403 | No | Reports are not tagged by crew that submitted them; this code does not get crew #. 
2017-2020 |17-19|182-223| [s17-19_get_reports.ipynb](code/s17-19_get_reports.ipynb)|s17-19_nocrew.csv | 2557| No | Reports are not tagged by crew that submitted them; this code does not get crew # 
| | | | [s17-19_add_crew_number.ipynb](code/s17-19_add_crew_number.ipynb) |s17-19_reports.csv| |  | This code adds crew number to reports. 

<br></br>

The output files do not have author name attached to them. Due to (potential) privacy issues, I am not sharing that code openly. However, you can contact me if you want code that merges reports' and authors' datasets. 


