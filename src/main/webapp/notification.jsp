<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Purchase Approvals</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>


<div class="container mt-4">
    <h4>Pending Purchase Requests</h4>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Model</th>
                <th>Price</th>
                <th>status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${pendingOrders}">
            <tr>
                <td>${order.id}</td>
                <td>${order.customer.customerName}</td>
                <td>${order.itemName}</td>
                <td>${order.model}</td>
                <td>${order.purchasePrice}</td>
                <td>
                <c:choose>
                    <c:when test="${order.status == 'APPROVED'}">
                        <span class="badge bg-success">Approved</span>
                    </c:when>
                    <c:when test="${order.status == 'REJECTED'}">
                        <span class="badge bg-danger">Rejected</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge bg-warning text-dark">Pending</span>
                    </c:otherwise>
                </c:choose>
                </td>
                <td>
                <form action="approved" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${order.id}" />
                    <button type="submit" class="btn btn-info btn-sm">Approved</button>
                </form>
                <form action="rejected" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${order.id}" />
                    <button type="submit" class="btn btn-danger btn-sm">Rejected</button>
                </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>