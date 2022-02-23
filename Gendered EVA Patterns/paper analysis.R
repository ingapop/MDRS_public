'''
Code for Walking on Mars: Gendered Group Processes in Space Analog Missions 


Full paper:

Popovaite, Inga and Bianchi, Alison J. (2022) "Walking on ‘‘Mars’’: Gendered Group Processes in Space Analog Missions," Journal of Human Performance in Extreme Environments: Vol. 17 : Iss. 1, Article 1.
DOI: 10.7771/2327-2937.1145
Available at: https://docs.lib.purdue.edu/jhpee/vol17/iss1/1 

'''

#load libraries

library(readxl)
library(lme4)
library(lmerTest)
library (jtools)

#set working directory. This sets working path to the current folder.  

mydir<-getwd()
setwd(mydir)


# Import dataset (located in the same directory)
mdrs<- read_excel("data_for_analysis.xlsx")
  
################################################################################
###Prepare data 
################################################################################


#turn role, gender, woman commander, and central person into factors:

mdrs$female<-as.factor(mdrs$female)
mdrs$fem_cdr<-as.factor(mdrs$fem_cdr)
mdrs$education<-as.factor(mdrs$education)
mdrs$previous.simulation<-as.factor(mdrs$previous_sim)
mdrs$bf2015<-as.factor(mdrs$bf2015)


#Create new variable EVA Participation Rate 

mdrs$participation_rate <- (mdrs$personal_eva/mdrs$crew_eva)*100

#check participation rate distribution (to meet linear regression assumptions)

hist(mdrs$participation_rate)

################################################################################
###Multilevel modeling 
################################################################################



################################################################################################
# M0. Empty model 
###################################################################################################


M0 <- lmerTest::lmer( participation_rate ~ ( 1 | crewID), data=mdrs)
summ(M0) 

# 30 groups, and 177 individuals. 13% of variation can be explained by between-crew differences. 

################################################################################
# M1-M7. Adding one IV at a time.
################################################################################


M1<- lmerTest::lmer( participation_rate ~ female + ( 1 | crewID), data=mdrs)

M2 <-lmerTest::lmer( participation_rate ~ female + education + ( 1 | crewID), data=mdrs)

M3<- lmerTest::lmer( participation_rate ~ female + education + role + ( 1 | crewID), data=mdrs)

M4<-lmerTest::lmer( participation_rate ~ female + education + role + previous_sim +( 1 | crewID), data=mdrs)

M5<-lmerTest::lmer( participation_rate ~ female + education + role + previous_sim + fem_cdr + ( 1 | crewID), data=mdrs)

M6 <-lmerTest::lmer( participation_rate ~ female + education + role + previous_sim + fem_cdr + woman_ratio +( 1 | crewID), data=mdrs)

M7 <-lmerTest::lmer( participation_rate ~ female + education + role + previous_sim + fem_cdr + woman_ratio + bf2015 + ( 1 | crewID), data=mdrs)



################################################################################
# ANOVA to see whether every subsequent model improve model fit 
################################################################################

anova(M0, M1) #p = .07
anova(M1, M2) #p = .03
anova(M2, M3) #p = .03
anova(M3, M4) #p = .55
anova(M4, M5) #p = .97
anova(M5, M6) #p = .94
anova(M6, M7) #p = .37






