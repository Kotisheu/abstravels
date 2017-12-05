<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>
 
     <jsp:include page="_header.jsp"></jsp:include>
 
       
<center>
    <h3 >Welcome to the homepage of ABSTravelling</h3>
   We offer flights at amazing deals! Come and book with us today! <br><br>
   <jsp:include page="searchView.jsp"></jsp:include>   
   <pre>
                                 \  \
                                      \__\
                                    ,/   /
                &lt;\  /&gt;            ,/    /
                 \\//           ,/     /
              ._  ( ``-..     ,/      /
       &lt;\  /&gt; | ```-..   ``-./       &lt;
        \\//  |       ``-..  ``-.     \
         ( ``-:./-.        ``-..O      \
        //-.    `-.`:-.   O      ``-..  \
       &lt;/   `-..   `-. `-..   O       ``-\.
            .-' `-...O     `-..    O       ``-..          /`-.
 .       .-''                   `-..     O       ``-..    /   /
 \\  .-''      ___ ___ ___ ___ __ __`_._      O     __)`./   /
 \\'     ,.--'                         `-..       /   \ )`./
  `\..--'                                  `-..   ``----'  `.
                                               ``,-...       `.
                                              ,-'    ,-`-...   )
                                           .-'    ,-'       ``` `-..
                                            `-..-'                  -
                                            </pre></center>
                                         
     <jsp:include page="_footer.jsp"></jsp:include>
 
  </body>
</html>