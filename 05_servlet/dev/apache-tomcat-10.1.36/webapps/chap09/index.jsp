<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cookie Handling</title>
</head>
<body>
<h1>Cookie Handling</h1>

<form action="cookie" method="get">
<%--    table>(tr>td*2)*3--%>
    <table style="margin: auto">
        <tr>
            <td>firstName:</td>
            <td><input type="text" name="firstName"></td>
        </tr>
        <tr>
            <td>lastName:</td>
            <td><input type="text" name="lastName"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">전송</button>
            </td>
        </tr>
    </table>