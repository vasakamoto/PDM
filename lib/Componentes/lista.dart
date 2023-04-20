// Objeto composto para inserir as entradas em uma lista

import "package:projeto_pdm/Componentes/ALM1379.dart";

class Album {

	final String artista;
	final String titulo;
	final double duracao; 
	final String genero;
	final String subgenero;
	final double nota;
    final int anoAdd;
    final int mesAdd;

	Album(this.artista, this.titulo, this.duracao, this.genero, this.subgenero, this.nota, this.anoAdd, this.mesAdd);

}

List<Album> lista = [];


List<Album> listaAlbuns(){

    if(lista.isEmpty){
        alm1();
        
    }


    return lista;
}

String mediaRating(){

    double media = 0.0;
    String valor;

    for(int x = lista.length - 1; x >= 0; x--){
        media += lista[x].nota;
    }

    valor = (media/(lista.length)).toStringAsFixed(2);

    return valor;
}

List<String> generosRecentes(){

    List<String> generos = [];

    for(int x = listaAlbuns().length - 1; x > listaAlbuns().length - 11; x--){
        generos.add(listaAlbuns()[x].genero);
    }

    return generos;

}

List<String> albunsRecent(){

    final List<String> albuns = [];

    for(int x = listaAlbuns().length - 1; x > listaAlbuns().length - 11; x--){
        albuns.add(listaAlbuns()[x].titulo);
    }

    return albuns;

}

class GenQuan{

    final String genero;
    final int quantidade;

    GenQuan(this.genero, this.quantidade);

}

List<GenQuan> generosquantidade = [];

class GenQuanAno {

    final String genero;
    final int quantidade;
    final int ano;

    GenQuanAno(this.genero, this.quantidade, this.ano);

}

List<GenQuanAno> generosquantidadeano = [];


genquanano(){

    listaAlbuns();
    
    List<List<dynamic>> todos = [];
    List<String> difgeneros = [];
    List<int> difanos = [];
    
    
    if(generosquantidadeano.isEmpty){
        for(int x = 0; x < lista.length; x++){
            todos.add([lista[x].genero, lista[x].anoAdd]);
            if(difgeneros.contains(lista[x].genero) == false){
                difgeneros.add(lista[x].genero);
            }
        }

        for(int x = 0; x < lista.length; x++){
            if(difanos.contains(lista[x].anoAdd) == false){
                difanos.add(lista[x].anoAdd);
            }
        }

        for(int x = 0; x < difgeneros.length; x++){
            for(int a = 0; a < difanos.length; a++){
                generosquantidadeano.add(GenQuanAno(difgeneros[x],
                todos.where((element) => (element.contains(difanos[a])) && (element.contains(difgeneros[x]))).length,
                difanos[a]));
                
            }
            generosquantidade.add(GenQuan(difgeneros[x], todos.where((element) => element.contains(difgeneros[x])).length));
        }
    }
}

class AnoQuan {

    final  int ano;
    final int quantidade;

    AnoQuan(this.ano, this.quantidade);
}

String artistaRepetido(){

    listaAlbuns();

    String maisRepetido;
    List<String> todos = [];
    List<String> repetidos = [];

    for(int x = 0; x < lista.length; x++){
        todos.add(lista[x].artista);
    }

    for(int x = 0; x < lista.length; x++){
        if(todos.where((element) => (element == todos[x])).length > 1){
            repetidos.add(lista[x].artista);
        }
    }

    maisRepetido = repetidos[0];

    return maisRepetido;
}

List<String> melhoravaliado() {

    listaAlbuns();

    List<String> album = [];
    double ava = 0.0;

    for(int x = 0; x < lista.length; x++){
        if(lista[x].nota > ava){
            album.clear();
            album.add(lista[x].artista); 
            album.add(lista[x].titulo);
        }
    }

    return album;
}