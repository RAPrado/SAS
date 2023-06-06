*Referencia : https://stackoverflow.com/questions/37055493/how-to-find-sas-version-from-sas-enterprise-guide;

%put ** my information;
%put short version: &sysver;
%put version: &sysvlong4;
%put site #: &syssite;
%put cpu: &sysscp &sysscpl;

*ou;

PROC PRODUCT_STATUS;
