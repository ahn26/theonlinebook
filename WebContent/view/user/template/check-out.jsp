<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/user/template" var="url" />
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>The online Book Store</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("username") == null) {
		response.sendRedirect(request.getContextPath() + "/view/user/login");
	}
	%>
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> onl.bookstore@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> +65 11.188.888
					</div>
				</div>
				<div class="ht-right">
					<a href="${pageContext.request.contextPath}/view/user/login"
						class="login-panel"><i class="fa fa-user"></i>Login</a> <a
						href="${pageContext.request.contextPath}/view/logout"
						class="login-panel"><i class="fa fa-user"></i>Logout</a>
					<div class="lan-selector">
						<select class="language_drop" name="countries" id="countries"
							style="width: 300px;">
							<option value='yt' data-image="${ url}/img/flag-2.jpg"
								data-imagecss="flag yt" data-title="English">English</option>
							<option value='yu' data-image="${ url}/img/flag-1.jpg"
								data-imagecss="flag yu" data-title="Bangladesh">VietNam
							</option>
						</select>
					</div>
					<div class="top-social">
						<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
							class="ti-twitter-alt"></i></a> <a href="#"><i
							class="ti-linkedin"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="${url}/index.jsp"> <img src="${url}/img/logo.png"
								alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<form
							action="${pageContext.request.contextPath}/view/user/search-key-topic"
							class="input-group" method="get">
							<div class="advanced-search">

								<select class="sorting" name="option-topic">
									<option value="default">Default Topic</option>
									<c:forEach items="${listcategory}" var="cate">
										<option value="${cate.name}">${cate.name}</option>
									</c:forEach>



								</select> <input type="text" size="40"
									placeholder="What kinds of books do you need?"
									name="search-key">
								<button>
									<i class="ti-search">Search</i>
								</button>

							</div>
						</form>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="heart-icon"><a href="#"> <i
									class="icon_heart_alt"></i> <span>1</span>
							</a></li>


							<li class="cart-icon"><a
								href="${pageContext.request.contextPath}/view/user/shopping-cart">
									<i class="icon_bag_alt"></i> <span>${length}</span>
							</a>
								<div class="cart-hover">
									<div class="select-items">
										<table>
											<tbody>
												<c:forEach items="${order.items}" var="listitem">
													<tr>
														<td class="si-pic"><img
															src="${pageContext.request.contextPath}/${listitem.product.urlTemp}"
															alt=""
															style="width: 110px; height: 67px; object-fit: cover; border: 1px solid #fff;"></td>
														<td class="si-text">
															<div class="product-selected">
																<p>$${listitem.product.price}</p>
																<h6>${listitem.product.name}</h6>
															</div>
														</td>

													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
									<div class="select-total">
										<span>total:</span>
										<h5>$${order.sumPrice}</h5>
									</div>


									<div class="select-button">
										<a
											href="${pageContext.request.contextPath}/view/user/shopping-cart"
											class="primary-btn view-card">VIEW CARD</a> <a
											href="${pageContext.request.contextPath}/view/user/checkout"
											class="primary-btn checkout-btn">CHECK OUT</a>
									</div>
								</div></li>
							<li class="cart-price">$${order.sumPrice}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>All departments</span>
						<ul class="depart-hover">
							<c:forEach items="${listcategory}" var="cate">
								<li><a
									href="${pageContext.request.contextPath}/view/user/shop/view-topic?check-topic=${cate.name}">${cate.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li><a href="${url}/index.jsp">Home</a></li>
						<li><a
							href="${pageContext.request.contextPath}/view/user/shop">Shop</a></li>
						<li><a href="#">Best sellers</a></li>
						<li><a
							href="${pageContext.request.contextPath}/view/user/contact">Contact</a></li>
						<li><a href="${ url}/blog-details.jsp"> Blog</a></li>
						<li><a href="#">User</a>
							<ul class="dropdown">
								<li><a
									href="${pageContext.request.contextPath }/view/user/profile">Profile
										User</a></li>
								<li><a
									href="${pageContext.request.contextPath }/view/register">Register</a></li>
								<li><a
									href="${pageContext.request.contextPath }/view/user/login">Login</a></li>
							</ul></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text product-more">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <a
							href="./shop.html">Shop</a> <span>Check Out</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">

			<h2 align="center" , style="color: green;">${checkTransaction}</h2>
			<form action="${pageContext.request.contextPath}/view/user/checkout"
				class="checkout-form" method="post">
				<div class="row">
					<div class="col-lg-6">

						<h4>Billing Details</h4>
						<div class="row">
							<div class="col-lg-6">
								<label for="fir">Username<span>*</span></label> <input
									type="text" id="fir" value="${requestScope.userDetail.name}">
							</div>

							<div class="col-lg-6">
								<label for="phone">Phone<span>*</span></label> <input
									type="text" id="phone" value="${requestScope.userDetail.phone}">
							</div>
							<div class="col-lg-6">
								<label for="email">Email Address<span>*</span></label> <input
									type="text" id="email" value="${requestScope.userDetail.email}">
							</div>


							<div class="col-lg-12">
								<label for="cun">Country<span>*</span></label> <input
									type="text" id="cun" value="Viet Nam">
							</div>
							<div class="col-lg-12">
								<label for="street">Address<span>*</span></label> <input
									type="text" id="street" class="street-first"
									value="${requestScope.userDetail.address}">
							</div>
							<div class="col-lg-12">
								<label for="zip">Message</label> <input type="text" id="zip"
									name="message">
							</div>


							<div class="col-lg-12"></div>
						</div>
					</div>
					<div class="col-lg-6">

						<div class="place-order">
							<h4>Your Order</h4>
							<div class="order-total">
								<ul class="order-table">
									<li>Product <span>Total</span>
									</li>
									<c:forEach items="${order.items}" var="list">

										<li class="fw-normal">${list.product.name}<span>$${list.product.price}</span></li>
										<li class="fw-normal" style>Quantity: ${list.amount}<span>$${list.price}</span></li>
									</c:forEach>


									<li class="total-price">Total <span>$${order.sumPrice}</span></li>
								</ul>

								<div class="order-btn">
									<button type="submit" class="site-btn place-btn">Place
										Order</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>


	<!-- Footer Section Begin -->
	<jsp:include page="/view/user/template/footer/footer.jsp" flush="true" />
</body>

</html>