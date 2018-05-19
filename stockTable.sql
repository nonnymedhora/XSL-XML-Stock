 create table STOCK_PRICES(
 Company VARCHAR(30) not null,
 Symbol  VARCHAR(5) not null,
 Price float(4,2) not null,
 PriceChange float(4,2),
 PercChange float(4,2) ,
 Volume integer not null,
 primary key (Symbol));