select t.[name] as [heading], t.[name] as [table], c.[name] as [column], ct.[name] as [type], (case when (c.[max_length] > 0) then convert(varchar, c.[max_length]) else 'MAX' end) as [length], c.[is_nullable] as [nullable], prop.[value] as [description],
(case when (exists(select *
	from sys.indexes i
	inner join sys.index_columns ic on (ic.[object_id] = i.[object_id]) and (ic.[index_id] = i.[index_id])
	where (i.[type] = 1) and (ic.[object_id] = t.[object_id]) and (ic.[column_id] = c.[column_id])
	)) then 'PK' end) as [pk],
(select top 1 quotename(kpt.[name]) + '.' + quotename(kpc.[name])
	from sys.foreign_key_columns kc
	inner join sys.columns kpc on (kpc.[object_id] = kc.[referenced_object_id]) and (kpc.[column_id] = kc.[referenced_column_id])
	inner join sys.tables kpt on (kpt.[object_id] = kc.[referenced_object_id])
	where (kc.[parent_object_id] = t.[object_id]) and (kc.[parent_column_id] = c.[column_id])
	) as [fk]
from sys.tables t
inner join sys.columns c on (c.[object_id] = t.[object_id])
inner join sys.types ct on (ct.[system_type_id] = c.[system_type_id])
left join sys.extended_properties prop on (prop.major_id = t.[object_id]) and (prop.minor_id = c.[column_id]) and (prop.name = 'MS_Description')
where (t.[type_desc] = 'USER_TABLE')
order by t.[name], [pk] desc, c.[name]
;

select t.[name] as [heading], t.[name] as [table], i.[name] as [index], i.[type_desc] as [type], i.[is_unique],
  dbo.concatenate(', ', (select c.[name] as [text()]
  from sys.index_columns ic
  inner join sys.columns c on (c.[object_id] = i.[object_id]) and (c.[column_id] = ic.[column_id])
  where (ic.[object_id] = i.[object_id]) and (ic.[index_id] = i.[index_id]) and (ic.[is_included_column] = 0)
  order by ic.[key_ordinal]
  for xml path('t'), type)) as [columns]
from sys.tables t
inner join sys.indexes i on (i.[object_id] = t.[object_id])
where (t.[type_desc] = 'USER_TABLE')
order by t.[name], i.[name]
;
