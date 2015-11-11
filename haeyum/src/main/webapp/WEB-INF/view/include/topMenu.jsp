<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="header">
	<div class="container-fluid">
		<nav>
			<div class="container">
				<div class="nav-top clearfix">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 155px; height: 65px"/></a>
					</div>
					<div class="search hidden-xs">
						<form action="#" method="GET">
							<input name="query" placeholder="Search" type="text">
							<button class="search-submit" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<button class="navbar-toggle" data-target=".navbar-collapse"
						data-toggle="collapse" type="button">
						<span class="sr-only">Toggle navigation</span><i
							class="fa fa-bars"></i>
					</button>
				</div>
			</div>

			<div class="main-nav navbar-collapse collapse">
				<div class="container">
					<div class="minilogo">
					<a href="${pageContext.request.contextPath}/index.jsp">
						<img src="${pageContext.request.contextPath}/images/logo.png" style="width: 105px; height: 45px"/>
						</a>
					</div>
					<ul class="nav nav-justified">
						<li><a class="active" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
						<li><a href="#">Search</a></li>
						<li><a href="#">Store</a></li>
						<li><a href="#">Login</a></li>
						<li><a href="#">Join</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- /end nav -->

	</div>
</header>