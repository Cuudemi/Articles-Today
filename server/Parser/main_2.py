from bs4 import BeautifulSoup
import json
import requests
import datetime
from fake_useragent import UserAgent
from main import get_urls

ua = UserAgent()

headers = {
    'accept': 'application/json, text/plain, */*',
    'user-Agent': ua.google,
}

article_dict = {}

# url = f'https://habr.com/ru/articles/803673/'
urls = get_urls()
for url in urls.values():

    req = requests.get(url, headers=headers).text

    soup = BeautifulSoup(req, 'lxml')
    article_name = soup.find('h1', 'tm-title tm-title_h1').find('span').text  # получаем статьи
    article_all_contents = soup.find('div', 'article-formatted-body').find_all('p')

    article_content = []

    for block in article_all_contents:
        foo = block.text
        article_content.append(foo)

    with open(f"{article_name}_{datetime.datetime.now().strftime('%d_%m_%Y')}.json", "w", encoding='utf-8') as f:
        try:
            article_dict = {'article_name': article_name, 'article_content': article_content}
            json.dump(article_dict, f, indent=4, ensure_ascii=False)
            print('Статьи были успешно получены')
        except:
            print('Статьи не удалось получить')

