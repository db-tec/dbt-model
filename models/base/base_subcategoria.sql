with base_subcategoria as (
    select
        DS_SUBCATEGORIA,
        ID_CATEGORIA,
        ID_SUBCATEGORIA,
        _AIRBYTE_SUBCATECORIA_HASHID
    from {{source('raw_magalu', 'subcategoria')}}
)
select * from base_subcategoria