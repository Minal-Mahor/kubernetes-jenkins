FROM python:latest
ADD app.py /
RUN pip install Flask
RUN pip install flask_restful
RUN python3 -m venv venv
RUN  export FLASK_APP=app.py
EXPOSE 5001
ENTRYPOINT [ "python" ] 
CMD [ "app.py" ]
