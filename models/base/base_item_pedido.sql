with base_item_pedido as (
    select
        ID_PEDIDO,
        ID_PRODUTO,
        QUANTIDADE,
        VR_UNITARIO,
        _AIRBYTE_ITEM_PEDIDO_HASHID
    from {{source('raw_magalu', 'item_pedido')}}
)
select * from base_item_pedido