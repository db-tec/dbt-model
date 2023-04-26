with base_pedido as (
    select
        DT_PEDIDO,
        ID_CLIENTE,
        ID_FILIAL,
        ID_PARCEIRO,
        ID_PEDIDO,
        VR_TOTAL_PAGO,
        _AIRBYTE_PEDIDO_HASHID
    from {{source('raw_magalu', 'pedido')}}
)
select * from base_pedido