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
