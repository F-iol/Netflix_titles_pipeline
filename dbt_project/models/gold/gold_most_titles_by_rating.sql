with silver_info as (
    select 
        show_id,
        rating
    from {{ ref('silver_titles') }}
)
select rating, count(distinct show_id) as total_titles
from silver_info
group by rating
order by total_titles desc