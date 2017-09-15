-- File (component) level
-- Different data for files
select 
	s.title as series_title
,	s.resourceLevel
,	b.title as file_title
,	b.dateExpression
,	case
		when adi.container1NumericIndicator is not null then coalesce(adi.container1Type, '') + ' ' + cast(adi.container1NumericIndicator as varchar(10))
		else ''
	end as instance_label_1
,	case
		when adi.container2NumericIndicator is not null then coalesce(adi.container2Type, '') + ' ' + cast(adi.container2NumericIndicator as varchar(10))
		else ''
	end as instance_label_2
,	case
		when adi.container3NumericIndicator is not null then coalesce(adi.container3Type, '') + ' ' + cast(adi.container3NumericIndicator as varchar(10))
		else ''
	end as instance_label_3
,	nt.notesEtcLabel -- use the standard consistent label, not the resource-specific override
,	replace(cast(n.noteContent as varchar(max)), char(10), '') as noteContent
from at23_base b
-- include some parent info for files
inner join at23_base s on b.parentResourceComponentId = s.resourceComponentId
inner join ArchDescriptionInstances adi on b.resourceComponentId = adi.resourceComponentId
left outer join ArchDescriptionRepeatingData n -- notes
	on b.resourceComponentId = n.resourceComponentId 
left outer join NotesEtcTypes nt
	on n.notesEtcTypeId = nt.notesEtcTypeId
where b.resourceLevel = 'file'
order by b.levelNumber, s.sequenceNumber, cast(s.title as varchar), b.sequenceNumber, cast(b.title as varchar)
;
