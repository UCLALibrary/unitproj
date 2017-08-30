-- Main (resource) level
select 
--	b.refId
	b.title
,	nt.notesEtcLabel -- use the standard consistent label, not the resource-specific override
--,	n.title as noteTitle
,	replace(cast(n.noteContent as varchar(max)), char(10), '') as noteContent
from at23_base b
left outer join ArchDescriptionRepeatingData n -- notes
	on b.resourceId = n.resourceId -- top/main level only, uses resourceid and not resourceComponentId
left outer join NotesEtcTypes nt
	on n.notesEtcTypeId = nt.notesEtcTypeId
where b.levelNumber = 0
--and nt.notesEtcLabel in ('Physical Characteristics and Technical Requirements', 'Separated Material')
order by b.levelNumber, b.sequenceNumber, cast(b.title as varchar)
;
