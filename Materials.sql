
select
  top 100
  c.record,
  case when c.section is NULL then lc.section else c.section end as SECTION,
  case when c.subject is NULL then lc.subject else c.subject end as SECTION,
  case when c.status is NULL then 'Awaiting' else c.status end as SECTION,
  c.activity_date
from
 [checklist] c
  left join [lookup.checklist] lc
    on c.template = lc.id
where record in
(
      '',  -- personid
      ''  -- app id

);
