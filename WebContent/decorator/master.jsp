<!DOCTYPE html>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<html lang="pt-BR">
  <head>
    <title>VStore</title>
    
	<jsp:include page="/template/styles.jsp" />
    <jsp:include page="/template/scripts.jsp" />
   
    <!-- atributos injetados pelo sitemesh -->
    <decorator:head/>
  </head>

  <body>
	
	<!-- sempre presente no topo da tela -->
	<jsp:include page="/template/principal-bar.jsp" />
	
	<!-- menu principal -->
	
	<!-- área do conteúdo -->
	<div class="container">
	    <div class="container-fluid">
		  	
		  	<!-- Inicio da flutuação do conteudo em sidebar e content -->	    
	      	<div class="row-fluid">
	      	
		    	<!-- conteudo lateral -->
		    	<div class="span3">
					<jsp:include page="/template/side-bar.jsp" />
				</div>
				
				<!-- Div Conteúdo Principal -->    
		        <div class="span9">
					<!-- conteudo injetado pelo sitemesh -->    
		        	<decorator:body/>
				</div><!--/span9-->
				
	      	</div><!--/row-fluid-->
		 </div><!-- /container-fluid -->
	     <hr/>
	
      	<footer class="footer">
			<jsp:include page="/template/footer.jsp" />
      	</footer>
    </div><!--/container-->

  </body>
</html>