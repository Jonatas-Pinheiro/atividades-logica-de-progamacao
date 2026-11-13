programa
{
    inclua biblioteca Graficos --> g
    inclua biblioteca Teclado --> t
    inclua biblioteca Mouse --> mo
    inclua biblioteca Util --> u

    // =========================================================
    // CONFIGURAÇÕES
    // =========================================================

    const inteiro LARGURA = 1000
    const inteiro ALTURA = 700

    const inteiro LARGURA_JOGADOR = 30
    const inteiro ALTURA_JOGADOR = 30

    const inteiro TAMANHO_INIMIGO = 28

    const inteiro MAX_INIMIGOS = 8
    const inteiro MAX_TIROS = 30

    // =========================================================
    // JOGADOR
    // =========================================================

    inteiro jogador_x = 480
    inteiro jogador_y = 330

    inteiro vida = 10000
    inteiro vida_maxima = 10000

    inteiro municao = 20
    inteiro municao_maxima = 20

    inteiro pontos = 0

    // Direção da mira
    inteiro mira_x = 500
    inteiro mira_y = 350

    // =========================================================
    // INIMIGOS
    // =========================================================

    inteiro inimigo_x[MAX_INIMIGOS]
    inteiro inimigo_y[MAX_INIMIGOS]

    inteiro vida_inimigo[MAX_INIMIGOS]

    logico inimigo_ativo[MAX_INIMIGOS]

    // =========================================================
    // TIROS
    // =========================================================

    inteiro tiro_x[MAX_TIROS]
    inteiro tiro_y[MAX_TIROS]

    inteiro tiro_dx[MAX_TIROS]
    inteiro tiro_dy[MAX_TIROS]

    logico tiro_ativo[MAX_TIROS]

    // =========================================================
    // ZONA SEGURA
    // =========================================================

    inteiro zona_x = 500
    inteiro zona_y = 350
    inteiro zona_raio = 320

    // =========================================================
    // ESTADO DO JOGO
    // =========================================================

    logico jogo_ativo = verdadeiro
    logico venceu = falso
    logico perdeu = falso

    // =========================================================
    // CONTROLE DE TIRO
    // =========================================================

    logico mouse_anterior = falso

    // =========================================================
    // FUNÇÃO PRINCIPAL
    // =========================================================

    funcao inicio()
    {
        g.iniciar_modo_grafico(falso)

        g.definir_dimensoes_janela(LARGURA, ALTURA)

        g.definir_titulo_janela("Free Fire 2D - Portugol")

        inicializar_jogo()

        enquanto (jogo_ativo)
        {
            atualizar_jogo()

            desenhar_jogo()

            u.aguarde(16)
        }

        desenhar_fim()

        u.aguarde(4000)

        g.encerrar_modo_grafico()
    }

    // =========================================================
    // INICIALIZA O JOGO
    // =========================================================

    funcao inicializar_jogo()
    {
        inteiro i

        jogador_x = 480
        jogador_y = 330

        vida = 100
        municao = 20
        pontos = 0

        zona_x = 500
        zona_y = 350
        zona_raio = 320

        venceu = falso
        perdeu = falso
        jogo_ativo = verdadeiro

        // Inicializa tiros
        para (i = 0; i < MAX_TIROS; i++)
        {
            tiro_ativo[i] = falso
        }

        // Inicializa inimigos
        para (i = 0; i < MAX_INIMIGOS; i++)
        {
            inimigo_ativo[i] = verdadeiro
            vida_inimigo[i] = 30
        }

        // Posições dos inimigos

        inimigo_x[0] = 100
        inimigo_y[0] = 100

        inimigo_x[1] = 800
        inimigo_y[1] = 100

        inimigo_x[2] = 150
        inimigo_y[2] = 550

        inimigo_x[3] = 850
        inimigo_y[3] = 550

        inimigo_x[4] = 250
        inimigo_y[4] = 150

        inimigo_x[5] = 700
        inimigo_y[5] = 200

        inimigo_x[6] = 300
        inimigo_y[6] = 500

        inimigo_x[7] = 700
        inimigo_y[7] = 500
    }

    // =========================================================
    // ATUALIZA O JOGO
    // =========================================================

    funcao atualizar_jogo()
    {
        se (vida <= 0)
        {
            vida = 0
            perdeu = verdadeiro
            jogo_ativo = falso
        }

        se (quantidade_inimigos() == 0)
        {
            venceu = verdadeiro
            jogo_ativo = falso
        }

        se (jogo_ativo)
        {
            ler_movimento()

            atualizar_mira()

            atirar()

            recarregar()

            atualizar_tiros()

            atualizar_inimigos()

            verificar_zona()

            diminuir_zona()

            verificar_colisoes()
        }
    }

    // =========================================================
    // MOVIMENTO DO JOGADOR
    // =========================================================

    funcao ler_movimento()
    {
        inteiro velocidade = 5

        se (t.tecla_pressionada(t.TECLA_W))
        {
            jogador_y = jogador_y - velocidade
        }

        se (t.tecla_pressionada(t.TECLA_S))
        {
            jogador_y = jogador_y + velocidade
        }

        se (t.tecla_pressionada(t.TECLA_A))
        {
            jogador_x = jogador_x - velocidade
        }

        se (t.tecla_pressionada(t.TECLA_D))
        {
            jogador_x = jogador_x + velocidade
        }

        // Impede o jogador de sair da tela

        se (jogador_x < 10)
        {
            jogador_x = 10
        }

        se (jogador_y < 50)
        {
            jogador_y = 50
        }

        se (jogador_x > LARGURA - LARGURA_JOGADOR - 10)
        {
            jogador_x = LARGURA - LARGURA_JOGADOR - 10
        }

        se (jogador_y > ALTURA - ALTURA_JOGADOR - 10)
        {
            jogador_y = ALTURA - ALTURA_JOGADOR - 10
        }
    }

    // =========================================================
    // MIRA
    // =========================================================

    funcao atualizar_mira()
    {
        mira_x = mo.posicao_x()
        mira_y = mo.posicao_y()
    }

    // =========================================================
    // ATIRAR
    // =========================================================

    funcao atirar()
    {
        logico mouse_atual

        mouse_atual = mo.botao_pressionado(mo.BOTAO_ESQUERDO)

        se (mouse_atual e nao mouse_anterior)
        {
            se (municao > 0)
            {
                criar_tiro()
                municao = municao - 1
            }
        }

        mouse_anterior = mouse_atual
    }

    // =========================================================
    // CRIA UM TIRO
    // =========================================================

    funcao criar_tiro()
    {
        inteiro i
        inteiro dx
        inteiro dy

        para (i = 0; i < MAX_TIROS; i++)
        {
            se (nao tiro_ativo[i])
            {
                tiro_x[i] = jogador_x + 15
                tiro_y[i] = jogador_y + 15

                dx = mira_x - tiro_x[i]
                dy = mira_y - tiro_y[i]

                // Normalização simples da direção
                se (dx > 0)
                {
                    tiro_dx[i] = 8
                }
                senao se (dx < 0)
                {
                    tiro_dx[i] = -8
                }
                senao
                {
                    tiro_dx[i] = 0
                }

                se (dy > 0)
                {
                    tiro_dy[i] = 8
                }
                senao se (dy < 0)
                {
                    tiro_dy[i] = -8
                }
                senao
                {
                    tiro_dy[i] = 0
                }

                tiro_ativo[i] = verdadeiro

                pare
            }
        }
    }

    // =========================================================
    // ATUALIZA TIROS
    // =========================================================

    funcao atualizar_tiros()
    {
        inteiro i
        inteiro j

        para (i = 0; i < MAX_TIROS; i++)
        {
            se (tiro_ativo[i])
            {
                tiro_x[i] = tiro_x[i] + tiro_dx[i]
                tiro_y[i] = tiro_y[i] + tiro_dy[i]

                // Tiro saiu da tela

                se (tiro_x[i] < 0 ou tiro_x[i] > LARGURA ou tiro_y[i] < 0 ou tiro_y[i] > ALTURA)
                {
                    tiro_ativo[i] = falso
                }

                // Verifica colisão com inimigos

                para (j = 0; j < MAX_INIMIGOS; j++)
                {
                    se (tiro_ativo[i] e inimigo_ativo[j])
                    {
                        se (colidiu(
                            tiro_x[i],
                            tiro_y[i],
                            8,
                            8,
                            inimigo_x[j],
                            inimigo_y[j],
                            TAMANHO_INIMIGO,
                            TAMANHO_INIMIGO))
                        {
                            vida_inimigo[j] = vida_inimigo[j] - 10

                            tiro_ativo[i] = falso

                            se (vida_inimigo[j] <= 0)
                            {
                                inimigo_ativo[j] = falso
                                pontos = pontos + 100
                            }
                        }
                    }
                }
            }
        }
    }

    // =========================================================
    // INIMIGOS
    // =========================================================

    funcao atualizar_inimigos()
    {
        inteiro i

        para (i = 0; i < MAX_INIMIGOS; i++)
        {
            se (inimigo_ativo[i])
            {
                se (inimigo_x[i] < jogador_x)
                {
                    inimigo_x[i] = inimigo_x[i] + 1
                }

                se (inimigo_x[i] > jogador_x)
                {
                    inimigo_x[i] = inimigo_x[i] - 1
                }

                se (inimigo_y[i] < jogador_y)
                {
                    inimigo_y[i] = inimigo_y[i] + 1
                }

                se (inimigo_y[i] > jogador_y)
                {
                    inimigo_y[i] = inimigo_y[i] - 1
                }
            }
        }
    }

    // =========================================================
    // COLISÃO ENTRE INIMIGO E JOGADOR
    // =========================================================

    funcao verificar_colisoes()
    {
        inteiro i

        para (i = 0; i < MAX_INIMIGOS; i++)
        {
            se (inimigo_ativo[i])
            {
                se (colidiu(
                    jogador_x,
                    jogador_y,
                    LARGURA_JOGADOR,
                    ALTURA_JOGADOR,
                    inimigo_x[i],
                    inimigo_y[i],
                    TAMANHO_INIMIGO,
                    TAMANHO_INIMIGO))
                {
                    vida = vida - 1
                }
            }
        }
    }

    // =========================================================
    // ZONA SEGURA
    // =========================================================

    funcao verificar_zona()
    {
        inteiro dx
        inteiro dy
        inteiro distancia_quadrada
        inteiro raio_quadrado

        dx = jogador_x - zona_x
        dy = jogador_y - zona_y

        distancia_quadrada = dx * dx + dy * dy
        raio_quadrado = zona_raio * zona_raio

        se (distancia_quadrada > raio_quadrado)
        {
            vida = vida - 1
        }
    }

    // =========================================================
    // DIMINUI A ZONA
    // =========================================================

    funcao diminuir_zona()
    {
        se (zona_raio > 150)
        {
            zona_raio = zona_raio - 1
        }
    }

    // =========================================================
    // RECARREGAR
    // =========================================================

    funcao recarregar()
    {
        se (t.tecla_pressionada(t.TECLA_R))
        {
            municao = municao_maxima

            u.aguarde(250)
        }
    }

    // =========================================================
    // CONTA INIMIGOS VIVOS
    // =========================================================

    funcao inteiro quantidade_inimigos()
    {
        inteiro i
        inteiro quantidade = 0

        para (i = 0; i < MAX_INIMIGOS; i++)
        {
            se (inimigo_ativo[i])
            {
                quantidade = quantidade + 1
            }
        }

        retorne quantidade
    }

    // =========================================================
    // FUNÇÃO DE COLISÃO
    // =========================================================

    funcao logico colidiu(
        inteiro x1,
        inteiro y1,
        inteiro largura1,
        inteiro altura1,
        inteiro x2,
        inteiro y2,
        inteiro largura2,
        inteiro altura2)
    {
        se (x1 < x2 + largura2 e
            x1 + largura1 > x2 e
            y1 < y2 + altura2 e
            y1 + altura1 > y2)
        {
            retorne verdadeiro
        }

        retorne falso
    }

    // =========================================================
    // DESENHA O JOGO
    // =========================================================

    funcao desenhar_jogo()
    {
        desenhar_fundo()

        desenhar_zona()

        desenhar_inimigos()

        desenhar_tiros()

        desenhar_jogador()

        desenhar_mira()

        desenhar_hud()

        g.renderizar()
    }

    // =========================================================
    // FUNDO
    // =========================================================

    funcao desenhar_fundo()
    {
        g.definir_cor(g.criar_cor(40, 120, 55))
        g.limpar()

        // Estradas

        g.definir_cor(g.criar_cor(80, 80, 80))

        g.desenhar_retangulo(
            0,
            300,
            LARGURA,
            100,
            falso,
            verdadeiro)

        g.desenhar_retangulo(
            450,
            50,
            100,
            600,
            falso,
            verdadeiro)

        // Linhas das estradas

        g.definir_cor(g.criar_cor(230, 230, 80))

        g.desenhar_linha(
            0,
            350,
            LARGURA,
            350)

        g.desenhar_linha(
            500,
            50,
            500,
            ALTURA)
    }

    // =========================================================
    // DESENHA ZONA
    // =========================================================

    funcao desenhar_zona()
    {
        g.definir_cor(g.criar_cor(80, 180, 255))

        g.desenhar_elipse(
            zona_x - zona_raio,
            zona_y - zona_raio,
            zona_raio * 2,
            zona_raio * 2,
            falso)
    }

    // =========================================================
    // DESENHA JOGADOR
    // =========================================================

    funcao desenhar_jogador()
    {
        // Corpo

        g.definir_cor(g.criar_cor(30, 100, 255))

        g.desenhar_retangulo(
            jogador_x,
            jogador_y,
            LARGURA_JOGADOR,
            ALTURA_JOGADOR,
            verdadeiro,
            verdadeiro)

        // Cabeça

        g.definir_cor(g.criar_cor(255, 220, 170))

        g.desenhar_elipse(
            jogador_x + 5,
            jogador_y - 12,
            20,
            20,
            verdadeiro)

        // Arma

        g.definir_cor(g.COR_PRETO)

        g.desenhar_linha(
            jogador_x + 15,
            jogador_y + 15,
            mira_x,
            mira_y)
    }

    // =========================================================
    // DESENHA INIMIGOS
    // =========================================================

    funcao desenhar_inimigos()
    {
        inteiro i

        para (i = 0; i < MAX_INIMIGOS; i++)
        {
            se (inimigo_ativo[i])
            {
                g.definir_cor(g.criar_cor(220, 40, 40))

                g.desenhar_retangulo(
                    inimigo_x[i],
                    inimigo_y[i],
                    TAMANHO_INIMIGO,
                    TAMANHO_INIMIGO,
                    verdadeiro,
                    verdadeiro)

                // Barra de vida

                g.definir_cor(g.COR_PRETO)

                g.desenhar_retangulo(
                    inimigo_x[i],
                    inimigo_y[i] - 8,
                    30,
                    4,
                    falso,
                    verdadeiro)

                g.definir_cor(g.COR_VERDE)

                g.desenhar_retangulo(
                    inimigo_x[i],
                    inimigo_y[i] - 8,
                    vida_inimigo[i],
                    4,
                    falso,
                    verdadeiro)
            }
        }
    }

    // =========================================================
    // DESENHA TIROS
    // =========================================================

    funcao desenhar_tiros()
    {
        inteiro i

        g.definir_cor(g.COR_AMARELO)

        para (i = 0; i < MAX_TIROS; i++)
        {
            se (tiro_ativo[i])
            {
                g.desenhar_elipse(
                    tiro_x[i],
                    tiro_y[i],
                    8,
                    8,
                    verdadeiro)
            }
        }
    }

    // =========================================================
    // DESENHA MIRA
    // =========================================================

    funcao desenhar_mira()
    {
        g.definir_cor(g.COR_BRANCO)

        g.desenhar_linha(
            mira_x - 8,
            mira_y,
            mira_x + 8,
            mira_y)

        g.desenhar_linha(
            mira_x,
            mira_y - 8,
            mira_x,
            mira_y + 8)
    }

    // =========================================================
    // HUD
    // =========================================================

    funcao desenhar_hud()
    {
        g.definir_cor(g.COR_PRETO)

        g.desenhar_retangulo(
            0,
            0,
            LARGURA,
            45,
            falso,
            verdadeiro)

        // Vida

        g.definir_cor(g.COR_VERMELHO)

        g.desenhar_retangulo(
            20,
            15,
            200,
            15,
            falso,
            verdadeiro)

        g.definir_cor(g.COR_VERDE)

        g.desenhar_retangulo(
            20,
            15,
            vida * 2,
            15,
            falso,
            verdadeiro)

        // Textos

        g.definir_cor(g.COR_BRANCO)

        g.desenhar_texto(
            230,
            13,
            "Vida: " + vida)

        g.desenhar_texto(
            360,
            13,
            "Municao: " + municao)

        g.desenhar_texto(
            500,
            13,
            "Pontos: " + pontos)

        g.desenhar_texto(
            650,
            13,
            "Inimigos: " + quantidade_inimigos())

        g.desenhar_texto(
            800,
            13,
            "R = recarregar")
    }

    // =========================================================
    // TELA FINAL
    // =========================================================

    funcao desenhar_fim()
    {
        g.definir_cor(g.COR_PRETO)
        g.limpar()

        g.definir_tamanho_texto(40)

        se (venceu)
        {
            g.definir_cor(g.COR_VERDE)

            g.desenhar_texto(
                350,
                250,
                "VITORIA!")

            g.definir_tamanho_texto(20)

            g.definir_cor(g.COR_BRANCO)

            g.desenhar_texto(
                360,
                310,
                "Voce eliminou todos os inimigos!")

            g.desenhar_texto(
                420,
                350,
                "Pontos: " + pontos)
        }
        senao
        {
            g.definir_cor(g.COR_VERMELHO)

            g.desenhar_texto(
                350,
                250,
                "DERROTA!")

            g.definir_tamanho_texto(20)

            g.definir_cor(g.COR_BRANCO)

            g.desenhar_texto(
                350,
                310,
                "Voce foi eliminado!")

            g.desenhar_texto(
                420,
                350,
                "Pontos: " + pontos)
        }

        g.renderizar()
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 816; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */