from bs4 import BeautifulSoup
import random
import json
import requests
import datetime
from fake_useragent import UserAgent
import pickle
from bs4 import BeautifulSoup
import requests
from fake_useragent import UserAgent


def get_urls() -> dict:
    ua = UserAgent()

    headers = {
        'accept': 'application/json, text/plain, */*',
        'user-Agent': ua.google,
    }

    article_dict = {}

    url = f'https://habr.com/ru/flows/develop/articles/'

    req = requests.get(url, headers=headers).text

    soup = BeautifulSoup(req, 'lxml')
    all_hrefs_articles = soup.find_all('a', class_='tm-title__link')  # получаем статьи

    for article in all_hrefs_articles:  # проходимся по статьям
        article_name = article.find('span').text  # собираем названия статей
        article_link = f'https://habr.com{article.get("href")}'  # ссылки на статьи
        article_dict[article_name] = article_link

    return article_dict


def get_article(url_article: str):
    ua = UserAgent()

    headers = {
        'accept': 'application/json, text/plain, */*',
        'user-Agent': ua.google,
    }

    article_content = {}

    req = requests.get(url_article, headers=headers).text

    soup = BeautifulSoup(req, 'lxml')
    article_name = soup.find('h1', 'tm-title tm-title_h1').find('span').text
    article_all_contents = soup.find('div', 'article-formatted-body').find_all(['p', 'h2', 'img'])

    tmp = []

    for block in article_all_contents:
        if block.name == 'img':
            tmp.append(f"<img src={block.get('src')}'/>")
            tmp.append(f"<title img>{block.get('title')}</title img>")
        elif block.name == 'p':
            tmp.append(f"<p>{block.text}</p>")
        elif block.name == 'h2':
            tmp.append(f"<h>{block.text}</h>")

    article_content["name"] = article_name
    article_content["url"] = url_article
    article_content["text"] = tmp

    write_in_file_dict(article_content)

    return tmp


def write_in_file_dict(dict_text):
    with open(f"test.json", "w", encoding='utf-8') as f:
        try:
            article_dict = {'article_name': dict_text["name"], 'article_url': dict_text["url"], 'article_context': dict_text["text"]}
            json.dump(article_dict, f, indent=4, ensure_ascii=False)
            print('Статьи были успешно получены')
        except:
            print('Статьи не удалось получить')


def write_in_file(array_text):
    with open(f"test.txt", "w", encoding='utf-8') as f:
        try:
            for line in array_text:
                f.write(line + "\n")
            print('Статьи были успешно получены')
        except:
            print('Статьи не удалось получить')


def get_images():
    pass


if __name__ == '__main__':
    urls_dict = get_urls()

    boo = get_article('https://habr.com/ru/articles/803987/')
    # for name, url in urls_dict.items():
    #     get_article(url)

    write_in_file(boo)


