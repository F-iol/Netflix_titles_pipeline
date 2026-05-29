with silver_info as (
    select 
        show_id,
        title,
        unnest(director_array) as director,
        release_year,
        type, 
        rating, 
        duration, 
        tags
    from {{ ref('silver_titles') }}
)
select director, count(*) as total_titles
from silver_info
where director is not null
group by director
order by total_titles desc