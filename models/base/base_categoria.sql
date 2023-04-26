with base_categoria as (    
    select
        DS_CATEGORIA,
        ID_CATEGORIA,
        PERC_PARCEIRO,
        _AIRBYTE_CATEGORIA_HASHID
    from {{source('raw_magalu', 'categoria')}}
)
select * from base_categoria