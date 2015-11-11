<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='UTF-8'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchVideo1.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchVideo2.css" type="text/css" />

<script src="${pageContext.request.contextPath}/js/searchVideo.js"></script>

</head>
<body class="test">
	<%@include file="../include/topMenu.jsp"%>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<section class="stretch">

		<!-- control buttons -->
		<div class="row">
			<div class="small-12 columns small-centered">
				<fieldset class="controls">
					<div class="row">
						<!-- filter buttons -->
						<div class="small-8 columns" id="controlsfilter">
							<label>Filter:</label>
							<button class="filter tiny round active" data-filter="all">All</button>
							<button class="filter tiny round" data-filter=".newyork">New
								York</button>
							<button class="filter tiny round" data-filter=".california">California</button>
							<button class="filter tiny round" data-filter=".texas">Texas</button>
						</div>
						<!-- layout buttons -->
						<div class="small-4 columns" id="controlslayout">
							<label>Layout:</label>
							<div class="controlslayout">
								<input type="radio" class="grid" checked="checked" name="layout"
									id="grid"><label id="labelgrid" for="grid"><i
									class="fa fa-th"></i></label></input><input type="radio" class="list"
									name="layout" id="list"><label id="labellist"
									for="list"><i class="fa fa-bars"></i></label></input>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
		<div class="row">
			<!-- container for images -->
			<div class="small-12 columns small-centered">
				<div class="container" id="Container">
					<div class="container-inner">
						<ul
						class="line-new small-block-grid-3 medium-block-grid-4 large-block-grid-5">
						<li class="mix newyork"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix newyork"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix california"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix newyork"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix texas"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix newyork"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix newyork"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix california"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="mix california"><img border="0"
							src="http://placehold.it/1000x800" /></li>
						<li class="gap" />
						<li class="gap" />
					</ul>
					</div>
				</div>
			</div>
		</div>

	</section>
<script>
$(function(){
  $('#Container').mixItUp();
});

$('input').on('click',function() {
    if ($(this).hasClass('grid')) {
        $('#Container ul').removeClass('small-block-grid-1').addClass('small-block-grid-3 medium-block-grid-4 large-block-grid-5');
    }
    else if($(this).hasClass('list')) {
        $('#Container ul').removeClass('small-block-grid-3 medium-block-grid-4 large-block-grid-5').addClass('small-block-grid-1');
    }
});
</script>
</body>
</html>