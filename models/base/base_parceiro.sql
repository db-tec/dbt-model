with base_parceiro as (
    select
        ID_PARCEIRO,
        NM_PARCEIRO,
        _AIRBYTE_PARCEIRO_HASHID
    from {{source('raw_magalu', 'parceiro')}}
)
select * from base_parceiro