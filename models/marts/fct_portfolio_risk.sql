select
    h.portfolio_id,
    count(distinct h.ticker) as ticker_count,
    round(sum(h.weight), 4) as total_weight,
    round(max(h.weight), 4) as max_single_weight,
    round(sum(h.weight * a.annual_return), 4) as weighted_expected_return,
    round(sum(h.weight * a.volatility), 4) as weighted_volatility_proxy,

    case
        when max(h.weight) >= 0.40 then 'High concentration'
        when count(distinct h.ticker) < 4 then 'Medium concentration'
        else 'Diversified'
    end as concentration_level

from {{ ref('stg_portfolio_holdings') }} h
left join {{ ref('dim_assets') }} a
    on h.ticker = a.ticker
group by h.portfolio_id
