/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.8
 * Generated at: 2017-02-06 10:02:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addEmployee_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Add Employee</title>\r\n");
      out.write("<!-- Bootstrap Core CSS -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<script src=\"JSNew/jquery-1.12.4-jquery.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"js/bootstrap-datepicker.js\"></script>\r\n");
      out.write("    <!-- Custom CSS -->\r\n");
      out.write("    <link href=\"css/sb-admin.css\" rel=\"stylesheet\">\r\n");
      out.write("    \r\n");
      out.write("    <link rel=\"stylesheet\"\r\n");
      out.write("    href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css\" />\r\n");
      out.write("\r\n");
      out.write("    <!-- Custom Fonts -->\r\n");
      out.write("    <link href=\"font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("    <script>\r\n");
      out.write("    \t\r\n");
      out.write("\t    $(document).ready(function(){\r\n");
      out.write("\t    \t\r\n");
      out.write("\t    \t\r\n");
      out.write("/* \t        $(\".sideM\").removeClass('active');\r\n");
      out.write("\t        $(\".itemM\").addClass('active');\r\n");
      out.write("\t        getHotelItemList(); */\r\n");
      out.write("\t    \t$('.datep').datepicker({\r\n");
      out.write("\t    \t\tformat : 'dd-mm-yyyy',\r\n");
      out.write("\t             autoclose:true\r\n");
      out.write("\t     \t});\r\n");
      out.write("\t    });\r\n");
      out.write("\t    \r\n");
      out.write("\t    function getItem(itemId){\r\n");
      out.write("\t    \t$.ajax({\r\n");
      out.write("    \t\t   url: 'getHotelItem.htm',\r\n");
      out.write("    \t\t   data: {itemId:itemId},\r\n");
      out.write("    \t\t   type: 'GET',\r\n");
      out.write("    \t\t   dataType: 'json',\r\n");
      out.write("    \t\t   error: function() {\r\n");
      out.write("    \t\t      $('#info').html('<p>An error has occurred</p>');\r\n");
      out.write("    \t\t   },\r\n");
      out.write("    \t\t   success: function(data) {\r\n");
      out.write("    \t\t\t   $(\"input[name='itemName']\").val(data.itemName);\r\n");
      out.write("    \t\t\t   $(\".description\").val(data.description);\r\n");
      out.write("    \t\t\t   $(\"input[name='price']\").val(data.price);\r\n");
      out.write("    \t\t\t   $(\".hid_itemId\").val(itemId);\r\n");
      out.write("    \t\t\t   $(\".btn-addItem\").html(\"Update\");\r\n");
      out.write("    \t\t   },\r\n");
      out.write("    \t\t});\r\n");
      out.write("\t    }\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");


    HttpSession session1 = request.getSession(false);

    if(session1.getAttribute("username") == null)
    {
    	response.sendRedirect("Login.jsp");
    }


      out.write("\r\n");
      out.write("<div id=\"wrapper\">\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false);
      out.write("\r\n");
      out.write("    <div id=\"page-wrapper\">\r\n");
      out.write("    <div class=\"container-fluid\">\r\n");
      out.write("<!--     \t<div class=\"panel panel-default col-sm-12\">\r\n");
      out.write("        \t<div class=\"panel-heading\">Login</div>\r\n");
      out.write("          \t<div class=\"panel-body\"> -->\r\n");
      out.write("          \t<h3 class=\"alert alert-info text-center\">ADD EMPLOYEE</h3>\r\n");
      out.write("          \t\t<form class=\"form-horizontal col-sm-offset-2\" method=\"post\" action=\"AddEmployeeServlet\" name=\"form1\">\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Employee Name</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t      <input class=\"form-control\" title=\"Add full name: first_Name mid_name last_name\" type=\"text\" name=\"name\" pattern=\"[a-zA-Z]+\\s[a-zA-Z]+\\s[a-zA-Z]+\" onkeypress=\"return onlyAlphabets(event,this)\" required>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Password</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t      <input class=\"form-control\" type=\"password\" name=\"password\" title=\"Atleast 1 Capital letter, 1 special symbol and 1 number and no spaces\" pattern=\"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).*$\" required>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t    \t<label class=\"col-sm-2 control-label\">Address</label>\r\n");
      out.write("\t\t\t\t    \t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t      \t\t<textarea class=\"form-control description\" name=\"address\" required></textarea>\r\n");
      out.write("\t\t\t\t    \t</div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Mobile Number</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t      <input class=\"form-control\" pattern=\"[789][0-9]{9}\" title=\"Start with 7/8/9\" id=\"contact\" name=\"contact\" type=\"text\" maxlength=\"10\" onkeypress=\"return isNumber(event)\" required>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Position Name</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t    \r\n");
      out.write("\t\t\t\t\t    <select class=\"form-control\" id=\"position\" name=\"position\" class=\"form-control\" required>\r\n");
      out.write("                           <option value=\"\" selected>Select your Post in Company</option>\r\n");
      out.write("                             <option value=\"Software Developer\">Software Developer</option>\r\n");
      out.write("                            <option value=\"General Manager\">General Manager</option>\r\n");
      out.write("                            <option value=\"Accountant\">Accountant</option>\r\n");
      out.write("                            <option value=\"HR Manager\">HR Manager</option>\r\n");
      out.write("                            <option value=\"CEO\">CEO</option>\r\n");
      out.write("                            <option value=\"System Administrator\">System Administrator</option>\r\n");
      out.write("                            <option value=\"Researcher\">Researcher</option>\r\n");
      out.write("                            <option value=\"Worker\">Worker</option>\r\n");
      out.write("                            <option value=\"Salesman\">Salesman</option>\r\n");
      out.write("                            <option value=\"Business Development Executive\">Business Development Executive</option>\r\n");
      out.write("                            <option value=\"Network Manager\">Network Manager</option>\r\n");
      out.write("                       \r\n");
      out.write("                       </select>\r\n");
      out.write("\t\t\t\t\t    \r\n");
      out.write("\t\t\t\t\t      \r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Email Address</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t      <input class=\"form-control\" type=\"email\" name=\"email\" required>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Salary</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t      <input class=\"form-control\" type=\"text\" name=\"salary\" required>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t    <label class=\"col-sm-2 control-label\">Date of Joining</label>\r\n");
      out.write("\t\t\t\t\t    <div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t      <input class=\"form-control datep\" type=\"text\" name=\"doj\" required>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t  \t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t    \t<div class=\"col-sm-offset-2 col-sm-10\">\r\n");
      out.write("\t\t\t\t      \t\t<button type=\"submit\" class=\"btn btn-success\">Add</button>\r\n");
      out.write("\t\t\t\t      \t\t");
 if(session.getAttribute("flag")!=null){
				      			out.print("<h3 class='alert alert-danger'>");
				    		out.print(session.getAttribute("flag"));
				    		session.setAttribute("flag",null);
				    		out.print("</h3>");
				    	} 
      out.write("\r\n");
      out.write("\t\t\t\t    \t</div>\r\n");
      out.write("\t\t\t\t     \r\n");
      out.write("\t\t\t\t  \t</div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("          \t</div>\r\n");
      out.write("    \t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- </div>\r\n");
      out.write("\t</div> -->\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("  $(document).ready( function(){\r\n");
      out.write("\t  \r\n");
      out.write("\t  \r\n");
      out.write("\t  $(\"textarea\").blur(function(){\r\n");
      out.write("\t\t  \r\n");
      out.write("\t\t  if($( this).val().trim() == \"\")\r\n");
      out.write("\t\t  {\r\n");
      out.write("\t\t  \r\n");
      out.write("\t\t          alert(\"Please enter address\");\r\n");
      out.write("\t\t  \r\n");
      out.write("\t\t  }\r\n");
      out.write("\t\t  \r\n");
      out.write("\t  });\r\n");
      out.write("\t  \r\n");
      out.write("\t  $(\"input\").blur(function(){\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t  \r\n");
      out.write("\t\t  if($(this).val().trim() == \"\")\r\n");
      out.write("\t\t\t  {\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t          alert(\"Form field cannot be empty\");\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  }\r\n");
      out.write("\t\t  else\r\n");
      out.write("\t\t\t  {\r\n");
      out.write("\t\t\t     \r\n");
      out.write("\t\t\t        var name =  $(this).attr(\"name\");\r\n");
      out.write("\t\t\t        \r\n");
      out.write("\t\t\t        if(name == \"password\")\r\n");
      out.write("\t\t\t        \t{\r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t                \tif($(this).val().trim().length < 5)\r\n");
      out.write("\t\t\t                \t\t{\r\n");
      out.write("\t\t\t                \t\t       alert(\"Length of Password must be at least 5 characters\");\r\n");
      out.write("\t\t\t                \t\t       \r\n");
      out.write("\t\t\t                \t\t       $(this).val('');\r\n");
      out.write("\t\t\t                \t\t       \r\n");
      out.write("\t\t\t                \t\t}\r\n");
      out.write("\t\t\t                \telse if(hasWhiteSpaceandTab($(this).val()))\r\n");
      out.write("\t\t\t                \t{\r\n");
      out.write("\t\t\t                \t     alert(\"Password cannot have white space character or tab character in it\");\r\n");
      out.write("\t\t\t                \t     $(this).val('');\r\n");
      out.write("\t\t\t                \t}\r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t        \t}\r\n");
      out.write("\t\t\t        \r\n");
      out.write("\t\t\t        else if(name == \"email\")\r\n");
      out.write("\t\t\t        \t{\r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t        \tvar mailformat = /^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/; \r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t        \tif(!$(this).val().trim().match(mailformat))\r\n");
      out.write("\t\t\t        \t\t{\r\n");
      out.write("\t\t\t        \t\t alert(\"You have entered an invalid email address!\"); \r\n");
      out.write("\t\t\t        \t\t $(this).val('');\r\n");
      out.write("\t\t\t        \t\t}\r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t        \t}\r\n");
      out.write("\t\t\t        else if(name == \"contact\")\r\n");
      out.write("\t\t\t        \t{\r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t        \t     if(!isInt($(this).val().trim()))\r\n");
      out.write("\t\t\t        \t    \t {\r\n");
      out.write("\t\t\t        \t    \t     alert(\"Enter a whole number in Phone Number Field\");\r\n");
      out.write("\t\t\t        \t    \t     $(this).val('');\r\n");
      out.write("\t\t\t        \t    \t }\r\n");
      out.write("\t\t\t        \t     else if($(this).val().trim().length != 10)\r\n");
      out.write("\t\t\t        \t    \t {\r\n");
      out.write("\t\t\t        \t    \t alert(\"Length of Mobile Number must be 10 digits\");\r\n");
      out.write("\t\t\t        \t    \t }\r\n");
      out.write("\t\t\t        \t    \r\n");
      out.write("\t\t\t        \t\r\n");
      out.write("\t\t\t        \t}\r\n");
      out.write("\t\t\t        \r\n");
      out.write("\t\t\t       \r\n");
      out.write("\t\t\t        else if(name == \"salary\")\r\n");
      out.write("\t\t        \t{\r\n");
      out.write("\t\t        \t\r\n");
      out.write("\t\t        \t     if(isNaN($(this).val().trim()))\r\n");
      out.write("\t\t        \t    \t {\r\n");
      out.write("\t\t        \t    \t     alert(\"Enter a number in Salary Field\");\r\n");
      out.write("\t\t        \t    \t     $(this).val('');\r\n");
      out.write("\t\t        \t    \t }\r\n");
      out.write("\t\t        \t    \r\n");
      out.write("\t\t        \t}\r\n");
      out.write("\t\t\t       \r\n");
      out.write("\t\t        \t\r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  }\r\n");
      out.write("\t  \r\n");
      out.write("\t  \r\n");
      out.write("\t  });\r\n");
      out.write("\t  \r\n");
      out.write("\t  \r\n");
      out.write("\t \r\n");
      out.write("\t  \r\n");
      out.write("  });\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  function hasWhiteSpaceandTab(s) {\r\n");
      out.write("\t  return /\\s/g.test(s);\r\n");
      out.write("\t}\r\n");
      out.write("  \r\n");
      out.write("  function isInt(value) {\r\n");
      out.write("\t\treturn !isNaN(value) && parseInt(Number(value)) == value\r\n");
      out.write("\t\t\t\t&& !isNaN(parseInt(value, 10));\r\n");
      out.write("\t}\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write(" \r\n");
      out.write("  \r\n");
      out.write("  </script>\r\n");
      out.write("  \r\n");
      out.write("  <script type=\"text/javascript\">\r\n");
      out.write("  \r\n");
      out.write("  function isNumber(evt) {\r\n");
      out.write("\t    evt = (evt) ? evt : window.event;\r\n");
      out.write("\t    var charCode = (evt.which) ? evt.which : evt.keyCode;\r\n");
      out.write("\t    if (charCode > 31 && (charCode < 48 || charCode > 57)) {\r\n");
      out.write("\t        return false;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    return true;\r\n");
      out.write("\t}\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  </script>\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  <script language=\"Javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("        function onlyAlphabets(e, t) {\r\n");
      out.write("            try {\r\n");
      out.write("                if (window.event) {\r\n");
      out.write("                    var charCode = window.event.keyCode;\r\n");
      out.write("                }\r\n");
      out.write("                else if (e) {\r\n");
      out.write("                    var charCode = e.which;\r\n");
      out.write("                }\r\n");
      out.write("                else { return true; }\r\n");
      out.write("                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || ($(\"[name='name']\").val().trim().length > 1 && charCode == 32))\r\n");
      out.write("                    return true;\r\n");
      out.write("                else\r\n");
      out.write("                    return false;\r\n");
      out.write("            }\r\n");
      out.write("            catch (err) {\r\n");
      out.write("                alert(err.Description);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
