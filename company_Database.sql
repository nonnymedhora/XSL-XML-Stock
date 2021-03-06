create database company;

use company;


 create table STOCK_PRICES(
 Company VARCHAR(30) not null,
 Symbol  VARCHAR(5) not null,
 Price float(4,2) not null,
 PriceChange float(4,2),
 PercChange float(4,2) ,
 Volume integer not null,
 primary key (Symbol));


insert into stock_prices values ('monsanto co', 'MTC', '37.00', '-13.38', '-26.6',  '32780000');
insert into stock_prices values ('peoplesoft inc', 'PSFT', '18.88', '-4.25', '-18.4', '20330000');  
insert into stock_prices values ('wind river systems', 'WIND', '35.81', '-3.56', '-9.1', '290000');
insert into stock_prices values ('amr corp', 'AMR', '48.00', '-3.75', '-7.3', '1370000');  
insert into stock_prices values ('affymetrix inc', 'AFFX', '20.31',  '-1.44',  '-6.6',  '80000');
insert into stock_prices values ('acxiom corp', 'ACXM', '18.88',  '-1.25',  '-6.2','2300000'); 
insert into stock_prices values ('qwest communications intl inc', 'QWST', '30.00', '-1.75', '-5.5', '1780000');  
insert into stock_prices values ('dell computer corp', 'DELL', '53.00',  '-3.06',  '-5.5',  '32950000');  
insert into stock_prices values ('incyte pharmaceuticals inc', 'INCY', '25.69',  '-1.44',  '-5.3',  '560000');  
insert into stock_prices values ('parametric technology', 'PMTC', '9.19', '-0.44', '-4.6', '3900000');  
insert into stock_prices values ('yahoo! inc', 'YHOO', '109.94',  '-4.50',  '-3.9',  '6480000');  
insert into stock_prices values ('schlumberger ltd', 'SLB', '44.50',  '-1.69',  '-3.7', '3230000'); 
insert into stock_prices values ('e m c corp mass', 'EMC', '52.19',  '-1.94',  '-3.6',  '3180000');  
insert into stock_prices values ('microsoft corp','MSFT','96.44', '-3.31', '-3.3', '12000000');  
insert into stock_prices values ('lucent technologies inc','LU', '64.44', '-2.19', '-3.3', '6820000');  
insert into stock_prices values ('cisco sys inc','CSCO','50.69','-1.69','-3.2','18230000');  
insert into stock_prices values ('sony corp','SNE','70.13', '-1.81','-2.5', '80000');  
insert into stock_prices values ('intel corp', 'INTC', '83.56',  '-1.88',  '-2.2',  '25170000');  
insert into stock_prices values ('nokia corporation','NOKA','70.81', '-1.44','-2.0','1060000');  
insert into stock_prices values ('daimler-benz a g rep 1 ord sh', 'DAI', '75.13',  '-1.44',  '-1.9',  '720000');  
insert into stock_prices values ('mci worldcom inc', 'WCOM', '46.50',  '-0.81',  '-1.7','11400000');  
insert into stock_prices values ('wal mart stores inc','WMT','59.94','-0.88','-1.4','2490000');  
insert into stock_prices values ('applied matls inc','AMAT','26.44','-0.38','-1.4','6110000');  
insert into stock_prices values ('america online inc', 'AOL', '92.25', '-1.13', '-1.2', '4990000');   
insert into stock_prices values ('first data corp', 'FDC', '20.94', '-0.19', '-0.9', '1140000');   
insert into stock_prices values ('globalstar telecommun ltd', 'GSTRF', '10.06', '-0.06', '-0.6', '490000');   
insert into stock_prices values ('cable & wireless pub ltd co', 'CWP', '32.13', '-0.19', '-0.6', '200000');   
insert into stock_prices values ('sun microsystems', 'SUNW', '44.75', '-0.25', '-0.6', '3450000');   
insert into stock_prices values ('american intl group inc', 'AIG', '74.13', '-0.06', '-0.1', '2660000');   
insert into stock_prices values ('news corp ltd', 'NWS', '23.13', '0.00', '0.0', '430000');   
insert into stock_prices values ('enron corp (oregon)', 'ENE', '51.19', '0.25', '0.5', '920000');   
insert into stock_prices values ('reuters group plc adr', 'RTRSY', '46.38', '0.25', '0.5', '240000');   
insert into stock_prices values ('nucor corp', 'NUE', '44.00', '0.38', '0.9', '140000');   
insert into stock_prices values ('fdx corp (holding co)', 'FDX', '47.75', '0.56', '1.2', '270000');   
insert into stock_prices values ('thermo electron corp', 'TMO', '14.88', '0.38', '2.6', '520000');   
insert into stock_prices values ('disney walt co (hldg co)', 'DIS', '25.50', '0.88', '3.6', '4860000');   
insert into stock_prices values ('state street corp', 'STT', '57.75', '2.00', '3.6', '520000');   
insert into stock_prices values ('smithkline beecham plc ord sh', 'SBH', '53.75', '1.88', '3.6', '900000');   
insert into stock_prices values ('schwab charles corp new', 'SCH', '41.81', '1.88', '4.7', '1230000');   
insert into stock_prices values ('marriott intl inc new cl a', 'MAR', '22.88', '1.19', '5.5', '570000');   
