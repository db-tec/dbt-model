with base_cliente as (
    select
        FLAG_OURO,
        ID_CLIENTE,
        NM_CLIENTE,
        _AIRBYTE_CLIENTE_HASHID
    from {{source('raw_magalu', 'cliente')}}
)
select * from base_cliente