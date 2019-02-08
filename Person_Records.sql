select top 10
  p.id,
  p.created,
  p.updated,
  p.email,
  p.name,
  p.first,
  p.middle,
  p.last,
  p.suffix,
  p.preferred,
  p.sex,
  p.birthdate,
  p.resident,
  p.phone,
  p.mobile,
  p.status,
  p.ref,
  p.[user],
  p.external_id,
  p.[identity],
  p.deceased,


from
  person p

where id = ''
;

select top 10
  ad.id,
  ad.street,
  ad.city,
  ad.region,
  ad.postal,
  ad.county,
  ad.country,
  ad.record,  -- person id
  ad.created,
  ad.updated,
  ad.type,
  ad.zip

from address ad
where
  record = '' -- this is the person id

;


select
  a.id,
  a.person,
  a.created,
  a.updated,
  a.status,
  b.name
from
  application a
  left join [lookup.bin] b
    on a.bin = b.id
where
  a.person = '';


  select
  --   top 100
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
  -- *
  from
    field f
    left join [lookup.prompt] p on f.prompt = p.id
  where
    f.record in (
          '' -- app id
    )

  order by f.field, f.record
  ;
