<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<html ng-app lang="pt-BR">
  <head>
    <title>Beauty Studio</title>
	<!-- import das meta-tags -->
	<jsp:include page="/template/meta.jsp" />
    
    <!-- Le styles -->
	<jsp:include page="/template/styles.jsp" />
	
	<!-- Le javascripts -->
    <!-- Placed at the end of the document so the pages load faster -->
    <jsp:include page="/template/scripts.jsp" />
    
    <!-- Fav and touch icons -->
	<jsp:include page="/template/favicon.jsp" />
   
    <!-- atributos injetados pelo sitemesh -->
    <decorator:head/>
  </head>

  <body>
	
	<!-- barra escura que fica sempre presente na tela -->
	<jsp:include page="/template/principal-bar.jsp" />
	
	<!-- menu principal -->
	<jsp:include page="/template/principal-menu.jsp" />
	
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
	
      	<footer>
			<jsp:include page="/template/footer.jsp" />
      	</footer>
    </div><!--/container-->

    <!-- Le javascripts -->
    <!-- Placed at the end of the document so the pages load faster -->

  </body>
</html>