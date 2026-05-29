with bronze_cte as (
    select 
        show_id,
        trim(title) as title,
        string_split(director,',') as director_array,
        cast(release_year as INT) as release_year,
        upper(rating) as rating,
        duration,
        type,
        string_split(listed_in,',') as tags,
        md5(title || release_year) as title_release_hash
    from
        {{ref ('bronze_titles')}}
)
select distinct
    *
from bronze_cte
where 
    release_year is not null 
    and title is not null
    and tags is not null
    and rating is not null
    and rating in ({% for rating in var('sel_ratings') %} '{{rating}}' {% if not loop.last %}, {% endif %} {% endfor %})