-- File (component) level
-- Different data for files
select
	b.title as fileTitle
,	b.dateExpression
--,	adi.instanceType
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
--,	n.title as noteTitle
,	replace(cast(n.noteContent as varchar(max)), char(10), '') as noteContent
from at23_base b
inner join ArchDescriptionInstances adi on b.resourceComponentId = adi.resourceComponentId
left outer join ArchDescriptionRepeatingData n -- notes
	on b.resourceComponentId = n.resourceComponentId 
left outer join NotesEtcTypes nt
	on n.notesEtcTypeId = nt.notesEtcTypeId
where b.resourceLevel = 'file'
--and nt.notesEtcLabel in ('Scope and Content', 'Physical Description', 'General note')
order by b.levelNumber, b.sequenceNumber, cast(b.title as varchar)
;
