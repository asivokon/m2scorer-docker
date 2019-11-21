FROM alpine:latest

WORKDIR /opt
ADD https://github.com/nusnlp/m2scorer/archive/version3.2.tar.gz /opt
RUN cd /opt && tar xzf version3.2.tar.gz

FROM python:2.7-alpine
COPY --from=0 /opt/m2scorer-version3.2 /opt/m2scorer
RUN pip install nltk==3.4
CMD python /opt/m2scorer/scripts/m2scorer.py
