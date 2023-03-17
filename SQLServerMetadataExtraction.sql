select obj.name as tableName, col.colorder as fieldSeq, col.name as fieldName,
typ.name as type,
col.prec as precision,
col.scale,
case when col.isnullable = 0 then 'N' else 'Y' end as isnullable

from sys.sysobjects obj 

inner join sys.syscolumns col 
on obj.id = col.id 

inner join sys.systypes typ 
on typ.xtype = col.xtype

where obj.xtype = 'U' 
and typ.name <> 'sysname'
order by obj.name, col.colid
