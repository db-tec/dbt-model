with base_produto as (
    select
        DS_PRODUTO,
        ID_PRODUTO,
        ID_SUBCATEGORIA,
        _AIRBYTE_PRODUTO_HASHID
    from {{source('raw_magalu', 'produto')}}
)
select * from base_produto