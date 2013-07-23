<br />
<div class="connection">
  <a class="connect btn btn-large" data-ipaddr="#connectIP#" data-username="#userid#" data-password="#password#" href="#">Connect!</a>
  <br />
  <br />
  <br />
  <b>Screen size:</b>
  <select id="vcl-screen-size">
    <option value="fullscreen">Full Screen</option>
    <option value="1600x1200">1600x1200</option>
    <option value="1280x1024">1280x1024</option>
    <option value="1024x768">1024x768</option>
    <option value="800x600">800x600</option>
    <option value="640x480">640x480</option>
  </select>
  <div class="vcl-setup">
    <br />
    <br />
    <fieldset class="vcl-osx-instructions">
      <legend>Setup instructions for Mac OS X</legend>
      <div class="vcl-instructions">
        <ul>
          <li>Please install the <a href="http://cord.sourceforge.net">CoRD</a> Remote Desktop client.</li>
        </ul>
      </div>
    </fieldset>
    <fieldset class="vcl-windows-instructions">
      <legend>Setup instructions for Windows</legend>
      <div class="vcl-instructions">
        <ul>
          <li>Please install the <a href="/downloads">VCL Connect</a> Remote Desktop client.</li>
        </ul>
        <p>
          <b>Note</b>: This software is <b><i>Experimental</i></b>. For other ways to connect, see the link below.
        </p>
      </div>
    </fieldset>
    <fieldset class="vcl-linux-instructions">
      <legend>Setup instructions for Linux</legend>
      <div class="vcl-instructions" style="width: 550px">
        <ol>
          <li>Please first install <a href="http://www.rdesktop.org">RDesktop</a>.</li>
          <li>You need to download a <a href="/rdp-handler.pl">protocol handler</a>.</li>
          <li>Install the handler to a convenient location, such as:
            <pre>install rdp-handler.pl /usr/local/bin</pre></li>
          <li>Enable the url handler: <pre>
gconftool-2 -s /desktop/gnome/url-handlers/rdp/command \
    "/usr/local/bin/rdp-handler.pl %s" --type String
gconftool-2 -s /desktop/gnome/url-handlers/rdp/enabled \
    --type Boolean true</pre></li>
        </ol>
      </div>
    </fieldset>
  </div>
</div>
<div class="accordion" id="vcl-instructions1">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#vcl-instructions1" href="#vcl-connecting">Alternate connection methods</a>
    </div>
    <div id="vcl-connecting" class="accordion-body collapse">
      <div class="accordion-inner">
        <div class="vcl-instructions">
          <div class="vcl-connectionmethod">
            <h4>Download an RDP file</h4>
              You can download an RDP file that can be opened by your Remote Desktop software.
              You will still need to enter the password listed on this page.<br/><br/>
              <div id="vcl-rdp-connection"></div>
          </div>
          <div class="vcl-connectionmethod">
              <h4>Manually enter the following<br /> information into an RDP client</h4>
              <ul>
                  <li><b>Remote Computer</b>: #connectIP#</li>
                  <li><b>User ID</b>: #userid#</li>
                  <li><b>Password</b>: #password#</li>
              </ul>
          </div>
        </div>
      </div>
    </div>
  </div> 
</div>
<div class="accordion" id="vcl-instructions2">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#vcl-instructions2" href="#vcl-additional">Additional instructions</a>
    </div>
    <div id="vcl-additional" class="accordion-body collapse">
      <div class="accordion-inner">
        <div class="vcl-instructions">
          If you did not click on the <b>Connect!</b> button from
          the computer you will be using to access the VCL system, you
          will need to return to the <strong>Current Reservations</strong>
          page and click the <strong>Connect!</strong> button from
          a web browser running on the same computer from which you will
          be connecting to the VCL system. Otherwise, you may be denied
          access to the remote computer.<br/><br/>
          <b>NOTE</b>: The given password is for <i>this reservation
          only</i>. You will be given a different password for any other
          reservations.<br />
        </div>
      </div>
    </div>
  </div>
</div>
