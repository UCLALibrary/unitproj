-- Sub-series (component) level
select
	b.title as subseriesTitle
,	nt.notesEtcLabel -- use the standard consistent label, not the resource-specific override
--,	n.title as noteTitle
,	replace(cast(n.noteContent as varchar(max)), char(10), '') as noteContent
from at23_base b
left outer join ArchDescriptionRepeatingData n -- notes
	on b.resourceComponentId = n.resourceComponentId 
left outer join NotesEtcTypes nt
	on n.notesEtcTypeId = nt.notesEtcTypeId
where b.resourceLevel = 'subseries'
and nt.notesEtcLabel in ('Scope and Content', 'Physical Description', 'Physical Characteristics and Technical Requirements')
order by b.levelNumber, b.sequenceNumber, cast(b.title as varchar)
;
