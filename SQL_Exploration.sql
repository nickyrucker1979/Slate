--  How to handle the duplicates?
select
  top 10 id, updated, email, first, last, status, name, person.[user]
from person
where email = '';

---  All Apps for a person
select
  a.person,
  a.id as APP_ID,
  a.created,
  a.updated,
  a.status,
  a.bin
from
  application a
where
  a.person = ''

--
