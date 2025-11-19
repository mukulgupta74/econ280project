# install.packages(c("readxl", "dplyr", "sandwich", "lmtest"))
library(readxl)
library(dplyr)
library(sandwich)
library(lmtest)

# import data
dat <- read_excel(
  "D:/UCSD-misc/acads/1-1/Econ 280 - Computation/econ280project/data/cleandata/Data for Regression.xlsx",
  sheet = "Data"
)

# helper: run OLS with robust SE and print
ols_robust <- function(formula, data) {
  m  <- lm(formula, data = data)
  co <- coeftest(m, vcov = vcovHC(m, type = "HC1"))
  list(model = m, robust = co)
}

## Subsets for year ranges
dat_75_95 <- dat %>% filter(Year >= 1975, Year <= 1995)
dat_96_15 <- dat %>% filter(Year >= 1996, Year <= 2015)
dat_80_95 <- dat %>% filter(Year >= 1980, Year <= 1995)

### 1. OLS with BTOT

btot_75_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*BTOT + BTOT +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_75_95
)

btot_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*BTOT + BTOT +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

### 2. OLS with BANKCR

bankcr_75_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*BANKCR + BANKCR +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_75_95
)

bankcr_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*BANKCR + BANKCR +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

### 3. OLS with LLY

lly_75_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*LLY + LLY +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_75_95
)

lly_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*LLY + LLY +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

### 4. OLS with PRIVCR

privcr_75_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*PRIVCR + PRIVCR +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_75_95
)

privcr_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*PRIVCR + PRIVCR +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

### 5. OLS with SCAPT (note: 1980-1995, 1996-2015)

scapt_80_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*SCAPT + SCAPT +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_80_95
)

scapt_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*SCAPT + SCAPT +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

### 6. OLS with SVALT (note: 1980-1995, 1996-2015)

svalt_80_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*SVALT + SVALT +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_80_95
)

svalt_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*SVALT + SVALT +
    Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

### 7. OLS with PRIVCR & Schooling interaction (FDISchooling)

privcr_sch_75_95 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*PRIVCR + PRIVCR +
    FDI*Schooling + Schooling + Population + GovtConsump +
    RegionDummy + Inflation + Trade,
  data = dat_75_95
)

privcr_sch_96_15 <- ols_robust(
  GDPgrowth ~ GDP0 + Investment + FDI + FDI*PRIVCR + PRIVCR +
    + FDI*Schooling + Schooling + Population + GovtConsump + RegionDummy +
    Inflation + Trade,
  data = dat_96_15
)

# To view robust results, e.g.:
privcr_75_95$robust
