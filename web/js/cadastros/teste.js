$(document).ready(function () {
                // Função para validar CPF
                function validarCPF(cpf) {
                    cpf = cpf.replace(/\D/g, ""); // Remove caracteres não numéricos

                    if (cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) {
                        return false; // CPF inválido se tiver tamanho diferente de 11 ou todos os dígitos forem iguais
                    }

                    let soma = 0, resto;
                    for (let i = 1; i <= 9; i++) {
                        soma += parseInt(cpf[i - 1]) * (11 - i);
                    }
                    resto = (soma * 10) % 11;
                    if (resto === 10 || resto === 11)
                        resto = 0;
                    if (resto !== parseInt(cpf[9]))
                        return false;
                    soma = 0;
                    for (let i = 1; i <= 10; i++) {
                        soma += parseInt(cpf[i - 1]) * (12 - i);
                    }
                    resto = (soma * 10) % 11;
                    if (resto === 10 || resto === 11)
                        resto = 0;
                    if (resto !== parseInt(cpf[10]))
                        return false;
                    return true;
                }

                // Validação e formatação do CPF ao sair do campo
                $('#cpf').on('blur', function () {
                    let cpf = $(this).val().replace(/\D/g, '');
                    if (!validarCPF(cpf)) {
                        $(this).addClass('is-invalid').removeClass('is-valid');
                        $('#cpf-invalid').show();
                    } else {
                        $(this).removeClass('is-invalid').addClass('is-valid');
                        $('#cpf-invalid').hide();
                    }
                });

                // Função para buscar o CEP via API e preencher os campos
                function buscarCEP(cep) {
                    cep = cep.replace(/\D/g, '');
                    if (cep.length !== 8) {
                        $('#cep').addClass('is-invalid').removeClass('is-valid');
                        $('#cep-invalid').show();
                        return;
                    }

                    $.getJSON(`https://viacep.com.br/ws/${cep}/json/`, function (dados) {
                        if (!dados.erro) {
                            $('#cidade').val(dados.localidade);
                            $('#estado').val(dados.uf);
                            $('#rua').val(dados.logradouro);
                            $('#bairro').val(dados.bairro);
                            $('#cep').removeClass('is-invalid').addClass('is-valid');
                            $('#cep-invalid').hide();
                        } else {
                            $('#cep').addClass('is-invalid').removeClass('is-valid');
                            $('#cep-invalid').show();
                        }
                    });
                }

                // Validação do CEP ao sair do campo
                $('#cep').on('blur', function () {
                    buscarCEP($(this).val());
                });
            });