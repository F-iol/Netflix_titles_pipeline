select *
from {{ ref('bronze_titles') }}
where 
    date_added is null 
    or release_year is null 
    or title is null
    or listed_in is null
    or rating is null