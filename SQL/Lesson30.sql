

create index idx_binance_stocks_price_history on binance_stocks_price_history (price_datetime)


explain ANALYZE
SELECT symbol_id, price_datetime
FROM public.binance_stocks_price_history
where
	symbol_id = 1
	and price_datetime between '2023-04-01 00:00:00'::timestamp and '2023-04-01 23:59:59'::timestamp
limit 100

explain ANALYZE
SELECT symbol_id, price_datetime
FROM public.binance_stocks_price_history
where
	price_datetime between '2023-04-01 00:00:00'::timestamp and '2023-04-01 23:59:59'::timestamp
	--and symbol_id = 1

Gather  (cost=1000.00..58184.61 rows=16101 width=20) (actual time=9.096..147.269 rows=14405 loops=1)
Execution Time: 147.795 ms


Gather  (cost=1000.00..58184.61 rows=16101 width=20) (actual time=9.750..108.942 rows=14405 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  ->  Parallel Seq Scan on binance_stocks_price_history  (cost=0.00..55574.51 rows=6709 width=20) (actual time=7.088..103.578 rows=4802 loops=3)
        Filter: ((price_datetime >= '2023-04-01 00:00:00'::timestamp without time zone) AND (price_datetime <= '2023-04-01 23:59:59'::timestamp without time zone))
        Rows Removed by Filter: 1463050
Planning Time: 0.059 ms
Execution Time: 109.451 ms

Bitmap Heap Scan on binance_stocks_price_history  (cost=99.54..9689.09 rows=3381 width=20) (actual time=0.585..1.300 rows=2881 loops=1)
  Recheck Cond: ((symbol_id = 1) AND (price_datetime >= '2023-04-01 00:00:00'::timestamp without time zone) AND (price_datetime <= '2023-04-01 23:59:59'::timestamp without time zone))
  Heap Blocks: exact=93
  ->  Bitmap Index Scan on binance_stocks_price_history_pkey  (cost=0.00..98.70 rows=3381 width=0) (actual time=0.555..0.555 rows=2881 loops=1)
        Index Cond: ((symbol_id = 1) AND (price_datetime >= '2023-04-01 00:00:00'::timestamp without time zone) AND (price_datetime <= '2023-04-01 23:59:59'::timestamp without time zone))
Planning Time: 0.078 ms
Execution Time: 1.422 ms


explain ANALYZE
SELECT symbol_id, price_datetime
FROM public.binance_stocks_price_history
where
	symbol_id = 1
	and price_datetime::date = '2023-04-01'
limit 100