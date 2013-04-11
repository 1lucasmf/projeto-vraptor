<div class="container">
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">

				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
					<span class="icon-bar"></span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</a>

				<!-- Everything you want hidden at 940px or less, place within here -->
				<div class="nav-collapse collapse">
				
					<ul class="nav">
						<li><a href="${pageContext.request.contextPath}/">home</a></li>
						<li class="divider-vertical"></li>
						
						<li><a href="${pageContext.request.contextPath}/help">help</a></li>
						<li class="divider-vertical"></li>
					</ul>
					<ul class="nav pull-right">
						<li>
							<a href="profile.html">${usuario}</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/login/logoff">logout</a>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->

			</div>
		</div>
	</div><!-- fim navbar -->
</div><!-- fim container -->