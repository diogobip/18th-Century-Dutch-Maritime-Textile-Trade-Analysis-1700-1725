select exchange_year, count(quantity) from fact_textile_trade
group by exchange_year;
 
select sum(total_value_guldens) as sum_guldens from fact_textile_trade
group by exchange_year
