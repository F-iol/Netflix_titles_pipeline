select *
from {{ source('local_files', 'netflix_titles') }}