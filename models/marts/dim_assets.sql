select
    ticker,
    asset_name,
    sector,
    asset_type,
    annual_return,
    volatility
from {{ ref('stg_assets') }}
