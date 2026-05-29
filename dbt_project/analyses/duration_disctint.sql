select  
    *
from {{ ref('bronze_titles') }}
where duration < 0