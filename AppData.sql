select   p.export, p.value, p.category, p.export4
from [lookup.prompt] p
where p.[key] in (
  'goal_ugrd_major',  -- undergrad interest
  'masters_academic_interest',  -- masters interest
  'doctorate_academic_interest'  -- professional interest
)
order by
  p.category,
  p.export
;
