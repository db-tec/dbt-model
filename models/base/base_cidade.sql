with base_cidade as (
    select
        DS_CIDADE,
        ID_CIDADE,
        ID_ESTADO,
        _AIRBYTE_CIDADE_HASHID
    from{{source('raw_magalu', 'cidade')}}
)
select * from base_cidade