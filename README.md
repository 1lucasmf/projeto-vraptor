@author: Lucas Moura
projeto-vraptor
=============

Projeto Iniciado baseado no curso online de vraptor da Caelum.
[mais informações sobre o curso em: http://www.caelum.com.br/curso/online/vraptor/]

Estou evoluindo o projeto com avaços nos estudos neste excelente framework.

Abaixo seguem as descrições de funcionalidades já agregadas ao projeto:

- Maven 3: Adição do pom com suas respectivas dependências, afim de evitar versionamento de jars.
- Hibernate 4 
- Dependencias do Spring: 
  - Obs: A dependencia do vraptor ja traz consigo a dependência do spring, porem adicionei as dependências em meu pom para
    que podesse especificar as versões do sping que queria trazer, pois as versões utilizadas no spring que vem com o vraptor
    estavam gerando conflitos com o hibernate4, problemas de injeção de dependência. (pelo menos foi isso que identifiquei no meu projeto)
- Sitemesh: Framework para criação de templates html. Para quem vem do JSF, ele é similar ao facelets.
- Css com Twitter Bootstrrap
- Controladores gerados baseados no Scaffold do vraptor. (achei bem clao e simples o código gerado pelo scaffold)

Funcionalidades que estão em desenvolvimento:
- Exemplos de uso da taglib Waffle [http://waffle.codehaus.org/]
- Utilização dos plugins do vraptor:
  -   vraptor-authentication
  -   vraptor-simplemail
  -   vraptor-jasperreport


Agradecimentos: 
- Ao amigo @leidsonmelo pela indicação e dicas sobre o framework.
- Ao @wbotelhos pelos seus excelentes tutorias em seu blog [http://wbotelhos.com]
  - pontapé inicial: http://wbotelhos.com/2009/12/07/iniciando-com-vraptor-3  
