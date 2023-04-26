{{config(materialized= 'table')}}

with categoria as (
    select * from {{ref('base_categoria')}}
),
cidade as (
    select * from {{ref('base_cidade')}}
),
cliente as (
    select * from {{ref('base_cliente')}}
),
estado as (
    select * from {{ref('base_estado')}}
),
filial as (
    select * from {{ref('base_filial')}}
),
item_pedido as (
    select * from {{ref('base_item_pedido')}}
),
parceiro as (
    select * from {{ref('base_parceiro')}}
),
pedido as (
    select * from {{ref('base_pedido')}}
),
produto as (
    select * from {{ref('base_produto')}}
),
subcategoria as (
    select * from {{ref('base_subcategoria')}}
),
fato_pedido as (
    select 
                pedido.id_pedido,
                cast(pedido.dt_pedido as date) dt_pedido,
                pedido.id_parceiro,
                parceiro.nm_parceiro,
                (categoria.perc_parceiro / 100) perc_parceiro,

                cast(((categoria.perc_parceiro / 100) * vr_total_pago) as numeric(15,2)) vr_debitar_parceiro,                 
                
                pedido.id_cliente,
                cliente.nm_cliente,
                cliente.flag_ouro,
                pedido.id_filial,
                filial.ds_filial,
                cidade.ds_cidade filial_cidade,
                estado.ds_estado filial_estado,
                produto.id_produto,
                produto.ds_produto,
                categoria.ds_categoria,
                subcategoria.ds_subcategoria,
                item_pedido.quantidade,
                item_pedido.vr_unitario,
                pedido.vr_total_pago 
                
            from 
                pedido
            left join 
                item_pedido on item_pedido.id_pedido = pedido.id_pedido
            left join
                produto on produto.id_produto = item_pedido.id_produto
            left join
                subcategoria on subcategoria.id_subcategoria = produto.id_subcategoria
            left join
                categoria on categoria.id_categoria = subcategoria.id_categoria
            left join
                parceiro on parceiro.id_parceiro = pedido.id_parceiro
            left join
                cliente on cliente.id_cliente = pedido.id_cliente
            left join
                filial on filial.id_filial = pedido.id_filial
            left join
                cidade on cidade.id_cidade = filial.id_cidade
            left join
                estado on estado.id_estado = cidade.id_estado
            where 1=1
)
select * from fato_pedido

