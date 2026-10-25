--"Which top 5 origin ports generated the highest total trade value in Guldens across the entire dataset?"--

select top 5 p.port_name, sum(f.total_value_guldens) as total_guldens from dim_ports p
join fact_textile_trade f
on p.port_id = f.origin_port_id
group by p.port_name
order by total_guldens desc;

select * from dim_textiles;

SELECT 
    t.textile_id,
    t.category,
    t.textile_name,
    COUNT(f.shipment_id) AS total_shipments
FROM dbo.dim_textiles t
LEFT JOIN dbo.fact_textile_trade f ON t.textile_id = f.textile_id
WHERE t.category IS NULL OR t.category = ''
GROUP BY t.textile_id, t.category, t.textile_name
ORDER BY total_shipments DESC;

update dbo.dim_textiles
set category = 'Uncategorized'
where category is null or trim(category) = '';

select * from dbo.dim_textiles

--"Commercial value per year"--
select 
    sum(total_value_guldens) as totalvalueguldens, 
    sum(quantity) as totalquantity,
    exchange_year 
from fact_textile_trade
group by exchange_year
order by exchange_year asc

--Saber qual das duas companhias comerciais marítimas movimentou o maior número de embarques e o maior valor total financeiro em Guldens.--

select 
    company,
    sum(quantity) as totalquantity,
    sum(total_value_guldens) as totalvaulueguldens 
from fact_textile_trade
group by company