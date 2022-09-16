compteur = 0
print ("bienvenue")

while compteur < 2 :
      compteur +=1
      user_id = input("entrer le nom")
      pass_id = input("entrer le mdp")

      if user_id == "sami" and pass_id == "sami" : 
 	                                          print("bienvenue",user_id)
      else:
           print("merci de réessayer")
