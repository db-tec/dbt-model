with base_estado as (
    select
        DS_ESTADO,
        ID_ESTADO,
        _AIRBYTE_ESTADO_HASHID
    from {{source('raw_magalu', 'estado')}}
)
select * from base_estado