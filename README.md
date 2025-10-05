# system-scripts
Collection of my utility scripts

**set-consoleblank:**
If host has a built in screen then this will turn it off after a set time to conserve power
<pre> curl -fsSL https://raw.githubusercontent.com/camcattay/system-scripts/main/set-consoleblank.sh | bash -s -- 67 </pre>

See Backups:
<pre> ls /etc/default/grub.bak.* </pre>
Remove Backups:
<pre>rm /etc/default/grub.bak.* </pre>

**system-info:**
Returns system, cpu, gpu, motherboard and memory information for host
<pre> curl -fsSL https://raw.githubusercontent.com/camcattay/system-scripts/main/system-info.sh | bash -s </pre>
