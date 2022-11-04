programa
{
	inclua biblioteca Sons -->s
	inclua biblioteca Teclado -->t
	inclua biblioteca Util -->u
	inclua biblioteca Graficos -->g
	
	inteiro tamanho_total = 50
	inteiro tamanho_comida = 10
	inteiro circuloy = 300
	inteiro circulox = 400
	inteiro dimensao_x = 1300
	inteiro dimensao_y = 900
	inteiro comidax = u.sorteia(1, dimensao_x-10)
	inteiro comiday = u.sorteia(1, dimensao_y-10)
	inteiro music = s.carregar_som("gasgas.mp3")
	
	funcao desenhar_circulo_principal(){
		g.definir_cor(g.COR_AZUL)
	     g.desenhar_elipse(circulox, circuloy, tamanho_total, tamanho_total, verdadeiro)
	}
	
	funcao desenhar_comida(){
	    	g.definir_cor(g.COR_VERDE)
	     g.desenhar_elipse(comidax, comiday, tamanho_comida, tamanho_comida, verdadeiro)
	}
	
	funcao inicializar_grafico(){
	     g.iniciar_modo_grafico(verdadeiro)
	     g.definir_titulo_janela("Agar.io")
	     g.definir_dimensoes_janela(dimensao_x, dimensao_y)
	     
	     reproduzir_som()
	     desenhar_bolinha()
	      	
	     g.definir_cor(g.COR_PRETO)
	     g.limpar()
	}
	
	funcao desenhar_bolinha(){
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
	     	desenhar_circulo_principal()
			desenhar_comida()
	          reiniciar_comida()
	          movimento_bolinha()  
	          placar()        
	    		
	          g.renderizar()
	     }
	}
	
	funcao limite_mapa(){
		se(circulox + tamanho_total >= dimensao_x){
			circulox-=10
		}senao se(circulox <= 1){
			circulox+=10
		}senao se(circuloy + tamanho_total >= dimensao_y){
			circuloy-=10
		}senao se(circuloy <= 1){
			circuloy+=10
		}
	}
	
	funcao movimento_bolinha(){	
	    	se(t.tecla_pressionada(t.TECLA_SETA_DIREITA) ou t.tecla_pressionada(t.TECLA_D)){
	          circulox++
	     }
	     se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA) ou t.tecla_pressionada(t.TECLA_A)){
	          circulox--
	     }
	     se(t.tecla_pressionada(t.TECLA_SETA_ACIMA) ou t.tecla_pressionada(t.TECLA_W)){
	          circuloy--
	     }
		se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO) ou t.tecla_pressionada(t.TECLA_S)){
	          circuloy++
		}
		se(tamanho_total >= 500 ou tamanho_total <= 0){
			g.fechar_janela()
		}
		comer()
		limite_mapa()
	}
	
	funcao logico definir_limite_comida(inteiro x, inteiro y, inteiro a, inteiro b){
		se(circulox >= x e circuloy >= y e circulox <= a+x e circuloy <= b+y){
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}
	
	funcao logico definir_limite_bolinha(inteiro x, inteiro y, inteiro a, inteiro b){
		se(comidax >= x e comiday >= y e comidax <= a+x e comiday <= b+y){
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}

	funcao logico comer(){
		se(definir_limite_comida(comidax, comiday, tamanho_comida, tamanho_comida) == verdadeiro){
			tamanho_total+=15
			retorne verdadeiro
		}
		se(definir_limite_bolinha(circulox, circuloy, tamanho_total, tamanho_total) == verdadeiro){
			tamanho_total+=15
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}

	funcao reiniciar_comida(){
		se(comer() == verdadeiro){
			comidax = u.sorteia(1, dimensao_x-10)
			comiday = u.sorteia(1, dimensao_y-10)
		}
	}

	funcao placar(){
		g.definir_cor(g.COR_AMARELO)
		g.desenhar_texto(dimensao_x / 2 - 100, 50, "Pontuação: " + tamanho_total)
		g.definir_tamanho_texto(25.0)
	}
		
	funcao reproduzir_som(){
	    	s.reproduzir_som(music, verdadeiro)
	    	s.definir_volume(70)		
	}
	    
	funcao inicio()
	{
	    	inicializar_grafico()    
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3141; 
 * @DOBRAMENTO-CODIGO = [130];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz;
 */