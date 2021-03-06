<html>

<head>
<title>registration</title>
<link href="registration.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
</head>
<body>

<div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Register here</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Registration Form</h1>
          
          <form  name="registrationpage" method="post" onsubmit="return registrationCheck()" action="rest/user/registration">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="fname" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name ="lname" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label class="dob">
              DOB<span class="req">*</span>
            </label>
            <input type="date" name="dob" required autocomplete="off"/>
          </div>

		<div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>

		<div class="field-wrap">
            <label>
              Confirm Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>
	

			<div class="bottom-row">
			<div id="items">
			<div class="field-wrap" id="field">
            <label>
              Account number<span class="req">*</span>
            </label>
            <input id="field1" type="text" name="accountnumber" required autocomplete="off"/>
          </div>

				<div class="field-wrap" id="field">
            <label>
              Account nick name<span class="req">*</span>
            </label>
            <input id="field1" type="text" name="nickname" required autocomplete="off"/>
          </div>
          </div>
		<div class="field-wrap">
				<input type="button" value="add" id="add">
		</div>
	</div>
		<div class="new-row">
			<span id="myForm"></span>
			<span id="myForm2"></span> 
		</div>


           <input class="button" type="submit" value ="get started" />
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form name="loginpage"  method="post" onsubmit="return loginCheck()" action="rest/user/login">
          
            <div class="field-wrap">
            <label>email id
              <span class="req">*</span>
            </label>
            <input type="email" name="email" required autocomplete="off"  />
          </div>
          
          <div class="field-wrap">
            <label>password
              <span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <input type="text" id="randomfield"disabled><br /><br/>
					<font color='red'> <div id="errormsg"> </div> </font>
          <input class="button" type="submit" value ="login" />
          
          </form>

        </div>
        
      </div>
      
</div>
	<script src="custom.js"></script>

	<script>

		
		var i=0; 


		function increment(){
		i +=1;
                              
		}

		function removeElement(parentDiv, childDiv){
 

		 if (childDiv == parentDiv) {
		      alert("The parent div cannot be removed.");
		 }
		 else if (document.getElementById(childDiv)) {     
		      var child = document.getElementById(childDiv);
		      var parent = document.getElementById(parentDiv);
		      parent.removeChild(child);
		 }
		 else {
		      alert("Child div has already been removed or does not exist.");
		      return false;
		 }
		}

		/* function accountfunction()
			{
			var r=document.createElement('span');
			var p=document.createElement('span');
			var y = document.createElement("INPUT");
			var z = document.createElement("INPUT");
			y.setAttribute("type", "text");
			y.setAttribute("placeholder","AccountNumber");
			y.setAttribute("name", "accountnumber");
			z.setAttribute("type", "text");
			z.setAttribute("placeholder","NickName");
			z.setAttribute("name", "nickname");
			var g = document.createElement("IMG");
			g.setAttribute("src", "delete.png");
			var h = document.createElement("IMG");
			h.setAttribute("src", "delete.png");
			increment(); 
			y.setAttribute("AccountNumber","textelement_"+i);
			z.setAttribute("NickName","textelement_"+i);
			r.appendChild(y);
			p.appendChild(z);
			g.setAttribute("onclick", "removeElement('myForm','id_"+ i +"')");
			h.setAttribute("onclick", "removeElement('myForm2','id_"+i +"')");
			r.appendChild(g);
			p.appendChild(h);
			r.setAttribute("id", "id_"+i);
			p.setAttribute("id", "id_"+i);
			document.getElementById("myForm").appendChild(r);
			document.getElementById("myForm2").appendChild(p);
			} */

		function loginCheck(){
			var password=document.loginpage.password.value; 
			var cpassword=document.loginpage.cpassword.value;  
			if(cpassword!=password){
				document.getElementById('errormsg').innerHTML = "Reconfirm the password";
				loginpage.password.focus();
				return false;
			}
		}		

		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});



$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});



	</script>
</body>

</html>
