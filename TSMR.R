# This analysis uses the MendelR package described in the following publication.
# Please cite the original article when using this code.
# Ke, X., Li, K., Lin, A., Zhang, Y. and Luo, P. (2025),
# MendelR: A One-Stop R Toolkit for Mendelian Randomization Analysis.
# Med Research.
# https://doi.org/10.1002/mdr2.70046
        
        
#1 Prepare_mr_packages
# For questions related to the code, please contact the author:
# Haozhang Huang (email: 1017988724@qq.com)

devtools::install_github("flash0926/mrhelp",force = T)
mrhelp::install_mr()
library(MendelR)

#2 Core_mr_analysis
mr_common("Metaanalysis_MDD_male_AllCohorts.tsv", "CHD_male.csv",p1 = 5e-08,p2 = 5e-05,r2 = 0.001,kb = 10000,steiger = T,run_presso = T)

mr_common("Metaanalysis_MDD_female_AllCohorts.tsv", "CHD_female.csv",p1 = 5e-08,p2 = 5e-05,r2 = 0.001,kb = 10000,steiger = T,run_presso = T)

#3 MRlap_analysis
run_MRlap(id_exposures="Metaanalysis_MDD_female_AllCohorts.tsv", id_outcomes="CHD_female.csv", 
          p1=5e-8, r2=0.001, kb=10000, pop="EUR")
run_MRlap(id_exposures="Metaanalysis_MDD_male_AllCohorts.tsv", id_outcomes="CHD_male.csv", 
          p1=5e-8, r2=0.001, kb=10000, pop="EUR")

#4 mr_sensitivity_analysis
mr_common("Metaanalysis_MDD_male_AllCohorts.tsv", "ieu-a-7",p1 = 5e-08,p2 = 5e-05,r2 = 0.001,kb = 10000,steiger = T,run_presso = T)
mr_common("Metaanalysis_MDD_female_AllCohorts.tsv", "ieu-a-7",p1 = 5e-08,p2 = 5e-05,r2 = 0.001,kb = 10000,steiger = T,run_presso = T)
