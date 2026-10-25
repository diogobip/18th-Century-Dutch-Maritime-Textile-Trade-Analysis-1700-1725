# Dutch Textile Trade, 1700-1724

An analysis of Dutch maritime textile trade in the early 18th century,
using Excel, SQL Server and Power BI.

## Project goal
Understand what were the main dynamics of the Dutch textile trade having as the main question "How the dutch trade evolved from 1700-1725?"

## Data
- Source:https://dutchtextiletrade.org/about/ 
- Coverage: shipments of the VOC and WIC trading companies, 1700-1724
- Size: 23,383 raw rows
- Values are recorded in Dutch guilders (Guldens)

## Tools and process
1. **Excel**: Data cleaning and understand wich columns were the most important for the analisys
2. **SQL Server**: cleaned the data and built a star schema with one fact
   table (`fact_textile_trade`) and two dimension tables (`dim_ports`,
   `dim_textiles`). Analysis queries are in `sql/`.
3. **Power BI**: dashboard with KPI cards (shipments, quantity, total
   Guldens), company split, top ports, textile breakdown and a yearly trend.

## Data cleaning
The raw dataset contained 506 broken rows caused by line breaks inside
text fields during import. These rows had no year, port, quantity or
value, and showed junk text or NULL in the `company` column. I removed
them when loading the fact table, leaving [N] rows. Textile categories
were missing in most rows, so empty values were set to "Uncategorized"
and the analysis uses `textile_name` instead.

## Key findings
- [Finding 1, with a number. e.g. which company had the higher total value]
- [Finding 2, e.g. the top origin ports]
- [Finding 3, e.g. how value changed over the years]

## Dashboard
<img width="1160" height="647" alt="image" src="https://github.com/user-attachments/assets/bb661244-8433-4e53-b2ba-bd264740ff12" />


## Limitations
- Textile category is missing in most rows, so category-level analysis is
  not reliable.
- Historical records may be incomplete or inconsistent.

## Repository structure
- `data/`: raw and cleaned CSV files
- `sql/`: cleaning and analysis queries
- `powerbi/`: the .pbix dashboard file
- `images/`: dashboard screenshots
