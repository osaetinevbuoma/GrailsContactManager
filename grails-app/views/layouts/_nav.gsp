<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <g:link class="navbar-brand" controller="contact">Grails Contact Manager</g:link>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><g:link controller="contact">Home</g:link></li>
        <li><g:link controller="contact" action="create">Add Contact</g:link></li>
        <li><g:link controller="groups" action="create">Add Group</g:link>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Welcome, ${ session.user.firstName } ${ session.user.surname } <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li class="dropdown-header">Account Settings</li>
            <li><a href="#">Personal Information</a></li>
            <li><a href="#">Change Password</a></li>
            <li class="divider"></li>
            <li><g:link controller="main" action="logout">Logout</g:link></li>
          </ul>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>