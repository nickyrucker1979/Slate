--  How to handle the duplicates?
select
  top 10 id, updated, email, first, last, status, name, person.[user]
from person
where email = '';
