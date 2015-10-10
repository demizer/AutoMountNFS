============
AutoMountNFS
============

A small systemd service I used for mounting NFS shares from a host on the local network using systemd and
NetworkManager-dispatch on Arch Linux.

---
Why
---

Systemd has support for automounting NFS shares using the x-systemd-automount option. However, if the server is not found on
the attached network, then the booting system will hang until systemd gives up trying to mount the missing shares. For
wireless hosts, this is not acceptable.

---
How
---

With NetworkManager-dispatcher enabled, systemd will activate any scripts contained in /etc/NetworkManager/dispatcher.d. This
is where 10-AutoMountNFS is installed. This script calls the AutoMountNFS systemd service which itself calls the
``automountnfs`` script that does the actual mounting. The ``automountnfs`` script checks for my nfs server, if it is found,
then it attempts to mount the nfs shares. If it is not found, then it attempts to umount any mounted shares. Simple.

Additionally, AutoMountNFS uses systemd timers to run every minute. If the NFS host cannot be reached, then the NFS mounts
are unmounted.

.. Unfortunately, systemd has set a 3 second timeout for NetworkManager-dispatcher
.. scripts. If a script goes over the alloted 3 seconds, it is terminated. When an
.. NFS share is first mounted, first mounting of an NFS share, sometimes it can take a little longer than five
.. seconds to perform the mount, so systemd terminates the NFS mounting script is
.. before it can finish. See https://bugzilla.redhat.com/show_bug.cgi?id=982734

.. For this reason, this package comes with a custom
.. NetworkManager-dispatcher.service to overide the default service script. See
.. https://bbs.archlinux.org/viewtopic.php?id=172112

-------
Install
-------

1. Clone

#. makekpg -c

#. pacman -U <compiled package>

#. Make sure NetworkManager-dispatcher is enabled:

   .. code:: bash

      systemctl enable NetworkManager-dispatcher

#. Enable and start AutoMountNFS

   .. code:: bash

      systemctl enable AutoMountNFS.timer
      systemctl start AutoMountNFS.timer

#. Check ``/var/run/automountnfs`` for output.
