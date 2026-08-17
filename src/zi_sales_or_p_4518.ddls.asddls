@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order position - Entity Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SALES_OR_P_4518 
as select from zsales_or_p_4518
association to parent ZI_SALES_OR_H_4518 as _header on $projection.SoUUID = _header.SoUUID
{
    key sop_uuid as SopUUID,
    parent_uuid as SoUUID,
    pos_so as PosSo,
    name as Name,
    description as Description,
    release_date as ReleaseDate,
    discontinued_date as DiscontinuedDate,
    price as Price,
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    height as Height,
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    width as Width,
    depth as Depth,
    quantity as Quantity,
    unit_of_measure as UnitOfMeasure,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _header
}
