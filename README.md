# Banco de Dados – Programa de Aquisição e Distribuição de Sementes

Descrição
Este repositório contém o modelo relacional em MySQL para um sistema de gestão de pedidos, entregas e estoque de sementes.
Ele permite controlar lotes, movimentações, entregas, fornecedores e armazéns, garantindo integridade e rastreabilidade.

# Estrutura do Banco
Tabelas Principais

usuario: dados de usuários (CPF/CNPJ, endereço, perfil).

perfil_usuario: tipos de perfis (gestor, operador, agente).

endereco: informações de endereço.

municipio e armazem: localidades e armazéns de armazenamento.

especies: espécies de sementes (ex.: milho, feijão).

lote: lotes vinculados a espécies e usuários.

estoque: controle de quantidade disponível por armazém.

pedido e item_pedido: gerenciamento de pedidos e itens.

entrega: registro de entregas realizadas.

fornecedor: informações sobre fornecedores.

destinatario: usuários que recebem pedidos.

log: histórico de operações.

estoque_lote e lote_pedido: tabelas de relacionamento.

Triggers

trg_valida_cpf_cnpj_usuario: garante que um usuário tenha apenas CPF ou CNPJ, nunca ambos ou nenhum.

trg_estoque_no_negative: impede que a quantidade de estoque seja negativa.

Procedimentos Armazenados

registrar_entrega – insere uma entrega com validações de integridade.

registrar_pedido – cria pedidos garantindo que usuário, fornecedor e status existam.

atualizar_status_entrega – atualiza o status de uma entrega existente.

consultar_entregas_pedido – lista todas as entregas de um pedido específico.
