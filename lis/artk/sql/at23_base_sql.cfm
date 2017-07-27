-- Top level resource data, with extra fields to allow unions with lower-level component data
-- Not valid on its own; will be cfincluded before other queries as appropriate.
with level0 as (
	select
		r.resourceId
	,	null	as resourceComponentId
	,	null	as parentResourceComponentId
	,	r.title
	,	r.dateExpression
	,	r.resourceLevel
	,	0	as sequenceNumber
	,	r.resourceidentifier1 + ' ' + r.resourceidentifier2 as refId
	,	0	as levelNumber
	from Resources r
<cfoutput>
	where r.resourceidentifier1 = '#parts[1]#'
	and r.resourceidentifier2 = '#parts[2]#'
	and r.resourceidentifier3 = '#parts[3]#'
</cfoutput>
)
,	level1 as (
	select
		rc1.resourceId
	,	rc1.resourceComponentId
	,	rc1.parentResourceComponentId
	,	rc1.title
	,	rc1.dateExpression
	,	rc1.resourceLevel
	,	rc1.sequenceNumber
	,	'' as refId
	,	1	as levelNumber
	from ResourcesComponents rc1
	-- level 1 components link to resources on resourceId, not (parent)resourceComponentId
	where rc1.resourceId in (select resourceId from level0)
)
,	level2 as (
	select
		rc2.resourceId
	,	rc2.resourceComponentId
	,	rc2.parentResourceComponentId
	,	rc2.title
	,	rc2.dateExpression
	,	rc2.resourceLevel
	,	rc2.sequenceNumber
	,	'' as refId
	,	2	as levelNumber
	from ResourcesComponents rc2
	-- level 2+ components link to parent components on (parent)resourceComponentId, not resourceId
	where rc2.parentResourceComponentId in (select resourceComponentId from level1)
)
,	level3 as (
	select
		rc3.resourceId
	,	rc3.resourceComponentId
	,	rc3.parentResourceComponentId
	,	rc3.title
	,	rc3.dateExpression
	,	rc3.resourceLevel
	,	rc3.sequenceNumber
	,	'' as refId
	,	3	as levelNumber
	from ResourcesComponents rc3
	-- level 2+ components link to parent components on (parent)resourceComponentId, not resourceId
	where rc3.parentResourceComponentId in (select resourceComponentId from level2)
)
,	level4 as (
	select
		rc4.resourceId
	,	rc4.resourceComponentId
	,	rc4.parentResourceComponentId
	,	rc4.title
	,	rc4.dateExpression
	,	rc4.resourceLevel
	,	rc4.sequenceNumber
	,	'' as refId
	,	4	as levelNumber
	from ResourcesComponents rc4
	-- level 2+ components link to parent components on (parent)resourceComponentId, not resourceId
	where rc4.parentResourceComponentId in (select resourceComponentId from level3)
)
,	all_data as (
	select * from level0
	union all
	select * from level1
	union all
	select * from level2
	union all
	select * from level3
	union all
	select * from level4
)
, at23_base as (
	select *
	from all_data
)