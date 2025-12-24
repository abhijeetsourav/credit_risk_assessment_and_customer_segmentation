# Credit Risk Assessment & Customer Segmentation

![Credit Risk Analysis](https://img.shields.io/badge/Status-Completed-brightgreen)
![Python](https://img.shields.io/badge/Python-3.8+-blue)
![Power BI](https://img.shields.io/badge/Power_BI-Executive%20Dashboard-orange)
![SQL](https://img.shields.io/badge/SQL-Portfolio%20Analysis-red)

## 📋 Project Overview

This project implements a comprehensive **Business Analyst-style credit risk assessment** using real LendingClub data to evaluate whether customers are **financially able to repay loans** and to improve risk decisions through data-driven customer segmentation.

### 🎯 Core Business Question
**"Is the customer financially able to repay the loan?"**

This project provides actionable insights for:
- Executive leadership making strategic lending decisions
- Risk management teams setting credit policies  
- Product teams designing pricing and approval workflows
- Compliance teams ensuring regulatory adherence

## ✨ Key Features

### 🔍 **Risk Analysis Capabilities**
- **5-tier customer segmentation**: Very Low Risk → Very High Risk
- **Primary risk driver identification**: DTI (Debt-to-Income) dominance over credit scores
- **Portfolio exposure analysis**: Dollar concentration and risk distribution
- **Policy impact simulation**: DTI cut-off scenarios and their effects

### 📊 **Executive Dashboard & Reporting**
- **Power BI executive dashboard** with interactive visualizations
- **Portfolio composition analysis** with risk segment distribution
- **Time-series trends** for loan origination and default patterns
- **Risk heatmaps** showing DTI × FICO interactions

### 💾 **Data Infrastructure**
- **SQL portfolio analysis** with 8 comprehensive queries
- **Python data processing** with pandas and statistical analysis
- **Clean dataset**: 1.88M completed loan records (2007-2015)
- **Feature engineering**: Risk flags, categorical bands, and derived metrics

## 📈 Key Business Insights

### 🚨 **Critical Finding: Affordability Dominates Risk**
- Borrowers with **DTI > 40% show 3x higher default rates** regardless of credit score
- **Medium Risk segment** represents 46% of portfolio volume but manageable risk
- **Credit scores cannot offset poor affordability** - DTI must act as hard gate

### 💡 **Actionable Recommendations**
1. **Implement DTI > 40% hard rejection rule** (could reduce portfolio default rate by ~8%)
2. **Reserve best rates only for Low DTI + High FICO customers**
3. **Enhanced monitoring for Medium Risk segment** (core lending book)
4. **Reassess pricing strategy** for High/Very High Risk segments

## 📊 Dataset Information

### 📋 **Original Dataset**
- **Source**: LendingClub Public Dataset
- **Time Period**: 2007-2015 (8 years of historical lending data)
- **Original Records**: ~2.9M loan applications
- **Final Analysis Dataset**: 1.88M completed outcome loans
- **Features**: 142 original columns, 15 business-relevant columns selected

[Dataset link](https://www.kaggle.com/datasets/ethon0426/lending-club-20072020q1)


### 📂 **Local Dataset**
- **File**: `Dataset/credit_portfolio.csv`
- **Processing**: Cleaned and filtered for completed outcomes only
