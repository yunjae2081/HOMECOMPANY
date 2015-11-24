


$(document).ready(function(){
	Kakao.init("c2b0d3737e4b2a24a9de420a361428b3");
	function getKakaotalkUserProfile(){
		Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				$("#kakao-profile").append(res.properties.nickname);
				
			},
			fail: function(error) {
				console.log(error);
			}
		});
	}
	function createKakaotalkLogin(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
		loginBtn.click(function(){
			Kakao.Auth.login({
				persistAccessToken: true,
				persistRefreshToken: true,
				success: function(authObj) {
					getKakaotalkUserProfile();
					createKakaotalkLogout();
				},
				fail: function(err) {
					console.log(err);
				}
			});
		});
		$("#kakao-logged-group").prepend(loginBtn)
	}
	function createKakaotalkLogout(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
		logoutBtn.click(function(){
			Kakao.Auth.logout();
			createKakaotalkLogin();
			$("#kakao-profile").text("");
		});
		$("#kakao-logged-group").prepend(logoutBtn);
	}
	if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
		createKakaotalkLogout();
		getKakaotalkUserProfile();
	}else{
		createKakaotalkLogin();
	}
});
