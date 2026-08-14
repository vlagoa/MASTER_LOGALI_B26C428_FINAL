@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order position - Consupmtions Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_SALES_OR_P_4518 as projection on ZI_SALES_OR_P_4518
{
    key SopUUID,
    SoUUID,
    PosSo,
    Name,
    Description,
    ReleaseDate,
    DiscontinuedDate,
    Price,
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    Height,
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    Width,
    Depth,
    Quantity,
    UnitOfMeasure,
     @Semantics.systemDateTime.lastChangedAt: true
    LocalLastChangedAt,
    /* Associations */
    _header: redirected to parent ZC_SALES_OR_H_4518
}
