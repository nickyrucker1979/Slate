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

--  View Application Responses

select
  top 100
  f.record,
  f.field,
  --   f.value,
  isnull(p.value,f.value) response,
  p.short,
  p.export,
  p.category,
  p.export2,
  p.export3,
  p.export4,
  p.export5,
  f.timestamp

from
  field f
  left join [lookup.prompt] p on f.prompt = p.id
where
  f.record in (
        '',
        '',
        '',
        ''
  )

order by f.field, f.record

;



;
