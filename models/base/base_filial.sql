with base_filial as (
    select
        DS_FILIAL,
        ID_CIDADE,
        ID_FILIAL,
        _AIRBYTE_FILIAL_HASHID
    from {{source('raw_magalu', 'filial')}}
)
select * from base_filial