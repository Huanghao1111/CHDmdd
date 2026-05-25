logistic_model <- glm(data1$CHD_total ~ 
                        data1$MDD_PRS_male+Age+assessment_centre+Genotype_batch1+
                        pc1+pc2+pc3+pc4+pc5+pc6+pc7+pc8+pc9+pc10, 
                      family = binomial(link = "logit"),
                      data = data1)
logistic_summary <- summary(logistic_model)
logistic_coefficients <- logistic_summary$coefficients
OR <- round(exp(logistic_coefficients[,1]), 3)  
pvalue <- round(logistic_coefficients[,4], 3)  
CIlow <- round(exp(logistic_coefficients[,1] - 1.96 * logistic_coefficients[,2]), 3) 
CIup <- round(exp(logistic_coefficients[,1] + 1.96 * logistic_coefficients[,2]), 3)   
result_logistic_model <- data.frame('HR' = OR,
                                    'CI low' = CIlow,
                                    'CI up' = CIup, 
                                    'P Value' = pvalue)
colnames(result_logistic_model) <- c("OR", "CI low", "CI up", "P Value")
result_logistic_model

logistic_model <- glm(data1$CHD_total ~ 
                        data1$MDD_PRS_female+Age+assessment_centre+Genotype_batch1+
                        pc1+pc2+pc3+pc4+pc5+pc6+pc7+pc8+pc9+pc10, 
                      family = binomial(link = "logit"),
                      data = data1)
logistic_summary <- summary(logistic_model)
logistic_coefficients <- logistic_summary$coefficients
OR <- round(exp(logistic_coefficients[,1]), 3)  
pvalue <- round(logistic_coefficients[,4], 3)  
CIlow <- round(exp(logistic_coefficients[,1] - 1.96 * logistic_coefficients[,2]), 3) 
CIup <- round(exp(logistic_coefficients[,1] + 1.96 * logistic_coefficients[,2]), 3)   
result_logistic_model <- data.frame('HR' = OR,
                                    'CI low' = CIlow,
                                    'CI up' = CIup, 
                                    'P Value' = pvalue)
colnames(result_logistic_model) <- c("OR", "CI low", "CI up", "P Value")
result_logistic_model
