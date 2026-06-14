select
    portfolio_id,
    upper(ticker) as ticker,
    cast(weight as float) as weight
from {{ ref('portfolio_holdings') }}
