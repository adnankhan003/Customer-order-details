<%@taglib prefix="c" uri="jakarta.tags.core" %>
<% response.setHeader("Cache-Control", "no-store"); %>
<jsp:useBean id="customer" class="model.CustomerBean" scope="session"/>
<c:if test="${empty customer.id}">
    <c:redirect url="index.jsp"/>
</c:if>
<html>
    <head>
        <title>Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #9BBEC8;
                margin: 0;
                padding: 0;
                text-align: center;
            }
    
            h1 {
                color: #164863;
            }
    
            h2 {
                color: #164863;
            }
    
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }
    
            table, th, td {
                border: 1px solid #ddd;
            }
    
            th, td {
                padding: 12px;
                text-align: left;
            }
    
            th {
                background-color: #164863;
                color: white;
            }
    
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
    
            /* a {
                color: #164863;
                text-decoration: none;
            }
    
            a:hover {
                text-decoration: underline;
            } */

            a {
            padding: 10px 15px;
            font-size: 16px;
            background-color: #164863;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            }

            a:hover {
            background-color: #427D9D;
            }
        </style>
    </head>
    
    <body>
        <h1>Welcome Customer ${customer.id}</h1>
        <h2>Your Orders</h2>
        <table border="1">
            <tr>
                <th>Product no</th>
                <th>Quantity</th>
                <th>Order Date</th>
            </tr>
            <c:forEach var="entry" items="${customer.orders}">
                <tr>
                    <td>${entry.productNo}</td>
                    <td>${entry.quantity}</td>
                    <td>${entry.orderDate}</td>
                </tr>
            </c:forEach>
        </table>
        <p>
            <a href="index.jsp?signout=true">Logout</a>
        </p>
    </body>
</html>