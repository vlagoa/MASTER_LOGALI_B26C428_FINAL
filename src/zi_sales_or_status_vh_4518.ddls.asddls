@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order status - Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SALES_OR_STATUS_VH_4518  
    as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name:'ZDO_ORDER_STATUS_4518' )   as Values
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZDO_ORDER_STATUS_4518' ) as Texts on  Values.domain_name = Texts.domain_name
                                                                                                and Values.value_low   = Texts.value_low
                                                                                                and Texts.language     = $session.system_language
{
       @ObjectModel.text.element: [ 'StatusText' ]
       @UI.textArrangement: #TEXT_ONLY
      @UI.lineItem: [{importance: #HIGH}]
  key  cast( Values.value_low as abap.char( 3 ) ) as StatusCode,
       Texts.text       as StatusText
}
