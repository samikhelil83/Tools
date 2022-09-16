import requests
from bs4 import BeautifulSoup
url = "https://www.topnet.tn"
page = requests.get(url)
# Voir le code html source
#print(page.content)
soup = BeautifulSoup(page.content, 'html.parser')
print (soup.title)
