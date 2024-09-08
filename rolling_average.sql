
with cte as 
(
  select date(transaction_time) as tran_dt,
        sum(transaction_amount) as tran_amt
  from transactions
  group by 1
),

rolling as
(
  select tran_dt,
  		tran_amt,
  		avg(tran_amt) over(order by tran_dt rows between 2 preceding and current row) as rolling_sum
 from cte)
 
select rolling_sum
from rolling
where tran_dt = '2021-01-31'
;
