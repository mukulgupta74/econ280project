//import data
import excel "D:\UCSD-misc\acads\1-1\Econ 280 - Computation\econ280project\data\cleandata\Data for Regression.xlsx", sheet("Data") firstrow

//OLS with BTOT
regress GDPgrowth GDP0 Investment FDI FDIBTOT BTOT Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1975 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDIBTOT BTOT Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r

//OLS with BANKCR
regress GDPgrowth GDP0 Investment FDI FDIBANKCR BANKCR Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1975 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDIBANKCR BANKCR Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r

//OLS with LLY
regress GDPgrowth GDP0 Investment FDI FDILLY LLY Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1975 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDILLY LLY Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r

//OLS with PRIVCR
regress GDPgrowth GDP0 Investment FDI FDIPRIVCR PRIVCR Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1975 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDIPRIVCR PRIVCR Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r

//OLS with SCAPT
regress GDPgrowth GDP0 Investment FDI FDISCAPT SCAPT Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1980 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDISCAPT SCAPT Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r

//OLS with SVALT
regress GDPgrowth GDP0 Investment FDI FDISVALT SVALT Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1980 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDISVALT SVALT Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r

//OLS with PRIVCR & Schooling
regress GDPgrowth GDP0 Investment FDI FDIPRIVCR PRIVCR FDISchooling Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1975 & Year <= 1995, r

regress GDPgrowth GDP0 Investment FDI FDIPRIVCR PRIVCR FDISchooling Schooling Population GovtConsump RegionDummy Inflation Trade if Year >= 1996 & Year <= 2015, r
