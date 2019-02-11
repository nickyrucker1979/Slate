select
top 100
  a.record, -- personid
  a.date,
  a.summary,
  a.source -- guid for source
from [activity] a
where
--   [public] = 1
--   and
  record =  ''  -- student guid
  and (data != 'Source' or data is null)
;
