select
    portfolio_id,
    total_weight
from {{ ref('fct_portfolio_risk') }}
where total_weight < 0.99
   or total_weight > 1.01
