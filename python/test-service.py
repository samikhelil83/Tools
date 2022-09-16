import subprocess


service = "sshd"


test = subprocess.call(["systemctl", "status", service])
if test == 0:
             res = "service runnig"
	     print (res)

else: 
             res = "service stopped"
	     print (res)
             subprocess.call(["systemctl", "start", service])

	     print("Started now")
