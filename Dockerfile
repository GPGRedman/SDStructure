FROM python:3.7
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED 1

RUN mkdir /code/SDCode \
	cd /code/SDCode \
	git clone https://github.com/GPGRedman/SDCode.git \
	mv /code/SDCode/* /code/

WORKDIR /code
COPY requirements.txt /code/
RUN  pip install -r requirements.txt
COPY docker-entrypoint.sh /code/

ENTRYPOINT ["/code/docker-entrypoint.sh"]
CMD [ "python",  "manage.py runserver 0.0.0.0:8000"]
EXPOSE 8000
