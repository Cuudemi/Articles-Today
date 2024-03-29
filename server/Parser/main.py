from bs4 import BeautifulSoup
import random
import json
import requests
import datetime
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
