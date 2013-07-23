<input class="ssh-cmd input-xxlarge vcl-osx-instructions vcl-linux-instructions" readonly="readonly" type="text" title="SSH Command" value="ssh #connectIP# -l #userid# -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"/>
<div class="vcl-setup" style="width: 500px">
  <br />
  <br />
  <fieldset>
    <legend>Connection information</legend>
    <div class="vcl-instructions">
      <ul>
        <li class="vcl-osx-instructions">You will need to use the Terminal application (Applications -&gt; Utilities) in order to connect to this reservation.</li>
        <li class="vcl-windows-instructions">You will first need to have an SSH client such as <a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/">PuTTY</a> installed.</li>
        <li class="vcl-windows-instructions">You will then need enter the reservation hostname into the client.</li>
        <li class="vcl-windows-instructions">After connecting, you will be prompted for a username and password. These values are listed below:<br />&nbsp;
          <ul>
            <li><b>Remote Computer</b>: #connectIP#</li>
            <li><b>User ID</b>: #userid#</li>
            <li><b>Password</b>: #password#<br></li>
          </ul>
        </li>
        <li class="vcl-linux-instructions">You will need a command line (Terminal or Console) interface in order to connect to your VCL reservation.</li>
        <li class="vcl-linux-instructions vcl-osx-instructions">After issuing the SSH command above, you will be prompted for the password listed below.</li>
      </ul>
      <div class="well vcl-password vcl-linux-instructions vcl-osx-instructions">#password#</div>
      <p><b>NOTE: You cannot use the Windows Remote Desktop Connection to connect to this computer. You must use an SSH client.</b></p>
    </fieldset>
  </div>
</div>
<div class="accordion" id="vcl-instructions1">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#vcl-instructions1" href="#vcl-additional">Additional instructions</a>
    </div>
    <div id="vcl-additional" class="accordion-body collapse">
      <div class="accordion-inner">
        <div class="vcl-instructions">
          <p>In order to use any graphical programs on this image,
          you will need to have an X server running on your local
          computer and use an ssh client to connect to the system.</p> 
          <p>If you did not click on the <b>Connect!</b> button from
          the computer you will be using to access the VCL system, you 
          will need to return to the <strong>Current Reservations</strong>
          page and click the <strong>Connect!</strong> button from
          a web browser running on the same computer from which you will
          be connecting to the VCL system. Otherwise, you may be denied
          access to the remote computer.<br/><br/>
          <b>NOTE</b>: The given password is for <i>this reservation
          only</i>. You will be given a different password for any other
          reservations.</p>
        </div>
      </div>
    </div>
  </div>
</div>
