<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="customer" class="model.CustomerBean" scope="session"/>
<jsp:setProperty name="customer" property="*"/>
<c:if test="${param.signout}">
    <c:set target="${customer}" property="id"/>
    <c:set target="${customer}" property="password"/>
    <c:redirect url="index.jsp"/>
</c:if>
<html>

    <head>
        <title>Home</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #9BBEC8;
                margin: 0;
                padding: 0;
            }
    
            form {
                max-width: 300px;
                margin: 20px auto;
                padding: 20px;
                background: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
    
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
    
            input[type="submit"] {
                background-color: #164863;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
    
            input[type="submit"]:hover {
                background-color: #164863;
            }
    
            p i {
                color: #ff0000;
            }

            h1,h2 {
                color: #164863;
                text-align: center;
                margin: 0;
            }
        </style>
    </head>
    
    <body>
        <h1>Welcome Customer</h1>
        <h2>Please Sign in</h2>
        <form method="post">
            <p>
                <b>Customer Id</b><br/>
                <input type="text" name="id" />
            </p>
            <p>
                <b>Password</b><br/>
                <input type="password" name="password"/>
            </p>
            <p>
                <input type="submit" name="submit" value="Login" />
            </p>
        </form>
        <c:if test="${param.submit == 'Login'}">
            <c:choose>
                <c:when test="${customer.authenticate()}">
                    <c:redirect url="detail.jsp"/>
                </c:when>
                <c:otherwise>
                    <p>
                        <i>Invalid Customer Id or Password</i>
                    </p>
                </c:otherwise>
            </c:choose>
        </c:if>
    </body>
</html>